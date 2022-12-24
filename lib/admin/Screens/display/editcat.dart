// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:firstui_project/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Helpers/funvalid.dart';
import '../../../Helpers/textfielddesign.dart';
import '../../adminprovider.dart';

class EditCategory extends StatelessWidget {
  CateModel category;
  EditCategory(this.category);

  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    name.text = category.name;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 254, 151, 0),
        title: Text("Edit Category"),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formstate,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    provider.pickImageForCategory();
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey,
                    child: provider.imageFile == null
                        ? Image.network(
                            category.image,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            provider.imageFile!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldDesign((val) {
                  return validInput(val!, 3, 20, "name");
                }, name, TextInputType.name, "Category name", false, false),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.updateCategory(category, name.text);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Color.fromARGB(255, 254, 151, 0),
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                  ),
                  child: textStyle(
                    "Edit Category",
                    18,
                    FontWeight.w400,
                    Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Text textStyle(String text, double size, FontWeight fontWeight, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: "Prompt",
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
