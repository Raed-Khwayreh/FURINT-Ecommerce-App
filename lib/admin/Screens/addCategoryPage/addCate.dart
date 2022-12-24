// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:firstui_project/Helpers/textfielddesign.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Helpers/funvalid.dart';
import '../../adminprovider.dart';

class AddCate extends StatelessWidget {
  AddCate({super.key});

  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add New Category",
          ),
          backgroundColor: Color.fromARGB(255, 254, 151, 0),
          centerTitle: true,
        ),
        body: Container(
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
                }, name, TextInputType.name, "Category name", false, false),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formstate.currentState!.validate()) {
                      if (await provider.addNewCategory(name.text)) {
                        name.clear();
                        Navigator.pop(context);
                        showDialog(
                            builder: (context) {
                              return AlertDialog(
                                title: textStyle(
                                  "Add Category",
                                  18,
                                  FontWeight.w400,
                                  Color.fromARGB(255, 0, 0, 0),
                                ),
                                content: textStyle(
                                  "New Category Added Successfully ",
                                  15,
                                  FontWeight.w400,
                                  Color.fromARGB(255, 0, 0, 0),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: textStyle(
                                      "OK",
                                      14,
                                      FontWeight.w400,
                                      Color.fromARGB(255, 254, 151, 0),
                                    ),
                                  )
                                ],
                              );
                            },
                            context: context);
                        provider.clearImage();
                      } else {
                        showDialog(
                            builder: (context) {
                              return AlertDialog(
                                title: textStyle(
                                  "Faild",
                                  18,
                                  FontWeight.w400,
                                  Color.fromARGB(255, 0, 0, 0),
                                ),
                                content: textStyle(
                                  "New Category can't been Added Successfully Check name and image",
                                  15,
                                  FontWeight.w400,
                                  Color.fromARGB(255, 255, 0, 0),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: textStyle(
                                      "OK",
                                      14,
                                      FontWeight.w400,
                                      Color.fromARGB(255, 254, 151, 0),
                                    ),
                                  )
                                ],
                              );
                            },
                            context: context);
                        provider.clearImage();
                      }
                    }
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
                    "Add Category",
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
    });
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
