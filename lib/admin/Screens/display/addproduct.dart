// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:firstui_project/Helpers/funvalid.dart';
import 'package:firstui_project/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Helpers/textfielddesign.dart';
import '../../adminprovider.dart';

class AddNewProduct extends StatelessWidget {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController oldPrice = TextEditingController();
  TextEditingController newPrice = TextEditingController();
  TextEditingController category = TextEditingController();
  String catId;
  AddNewProduct(this.catId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 254, 151, 0),
        title: Text("New Product"),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formstate,
            child: SingleChildScrollView(
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
                          ? const Center(
                              child: Icon(Icons.camera),
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
                  }, name, TextInputType.name, "product name", false, false),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldDesign((val) {
                    return validInput(val!, 3, 20, "name");
                  }, name, TextInputType.name, "new price", false, false),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldDesign((val) {
                    return validInput(val!, 3, 20, "name");
                  }, name, TextInputType.name, "old price", false, false),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldDesign((val) {
                    return validInput(val!, 3, 20, "name");
                  }, name, TextInputType.name, "category", false, false),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
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
