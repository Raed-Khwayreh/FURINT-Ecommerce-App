// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/signprovider.dart';

class TextFieldDesign extends StatelessWidget {
  final String? Function(String?)? valid;
  TextEditingController cont;
  TextInputType inputType;
  String hint;
  bool obscureTextState;
  bool signType;
  TextFieldDesign(this.valid, this.cont, this.inputType, this.hint,
      this.obscureTextState, this.signType,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignProvider>(
      builder: (context, value, child) {
        return TextFormField(
          validator: valid,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: cont,
          keyboardType: inputType,
          obscureText: obscureTextState,
          decoration: InputDecoration(
            suffix: hint == "**********"
                ? InkWell(
                    onTap: () {
                      signType
                          ? {
                              if (value.hidePassSignUp == true)
                                {value.changeIconShowSignUp()}
                              else
                                {value.changeIconHideSignUp()}
                            }
                          : {
                              if (value.hidePassSignIn == true)
                                {value.changeIconShowSignIn()}
                              else
                                {value.changeIconHideSignIn()}
                            };
                    },
                    child: signType ? value.icoSignUp : value.icoSignIn,
                  )
                : InkWell(
                    child: Text(""),
                  ),
            errorMaxLines: 3,
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 253, 0, 0),
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 253, 0, 0),
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 245, 245, 245),
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 245, 245, 245),
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            hintText: hint,
            fillColor: Color.fromARGB(255, 245, 245, 245),
            filled: true,
            hintStyle: TextStyle(
                fontFamily: "Prompt2",
                color: Color.fromARGB(255, 197, 197, 197)),
          ),
        );
      },
    );
  }
}
