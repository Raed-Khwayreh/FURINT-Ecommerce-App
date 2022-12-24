// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:firstui_project/Login/letsgo.dart';
import 'package:firstui_project/UserPage/profilesettings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/signprovider.dart';
import '../mainpage.dart';
import '../Helpers/slideanimation.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<SignProvider>(builder: (context, provider, child) {
      return Container(
        margin: EdgeInsets.fromLTRB(25, 5, 25, 0),
        color: Color.fromARGB(26, 255, 255, 255),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("  "),
                  textStyle(
                    "Profle",
                    20,
                    FontWeight.w200,
                    Color.fromARGB(255, 0, 0, 0),
                  ),
                  Icon(
                    Icons.support_agent,
                    color: Color.fromARGB(255, 143, 143, 143),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Color.fromARGB(255, 201, 201, 201),
                height: 1,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 54, 54, 54),
                          offset: Offset(0, 0),
                          blurRadius: 8,
                          spreadRadius: -5),
                    ],
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          maxRadius: 35,
                          backgroundImage: provider.loggedUser?.imageUrl == null
                              ? NetworkImage(
                                  "https://i.stack.imgur.com/l60Hf.png")
                              : NetworkImage(
                                  (provider.loggedUser?.imageUrl)!,
                                ),
                        ),
                        Positioned(
                          bottom: -5,
                          right: -5,
                          child: InkWell(
                            onTap: () {
                              provider.uploadNewFile();
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 236, 236, 236),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textStyle(
                          provider.loggedUser!.userName,
                          20,
                          FontWeight.w500,
                          Color.fromARGB(255, 0, 0, 0),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        textStyle(
                          "(+97) ${provider.loggedUser!.phoneNumber}",
                          15,
                          FontWeight.w200,
                          Color.fromARGB(255, 131, 131, 131),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: profileSettings.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            profileSettings[index]['icon'],
                            color: Color.fromARGB(255, 254, 151, 0),
                          ),
                          title: Row(
                            children: [
                              textStyle(
                                profileSettings[index]['text'],
                                18,
                                FontWeight.w300,
                                Color.fromARGB(255, 0, 0, 0),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              profileSettings[index]['text'] == "Language"
                                  ? textStyle(
                                      "English(US)",
                                      12,
                                      FontWeight.w300,
                                      Color.fromARGB(255, 94, 94, 94),
                                    )
                                  : Text(""),
                            ],
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Color.fromARGB(255, 112, 112, 112),
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 158, 158, 158),
                          height: 3,
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  provider.signOut();
                  Navigator.push(
                    context,
                    SliderAnimation(Page: LetsGo()),
                  );
                },
                child: textStyle(
                  "Sign out",
                  18,
                  FontWeight.w300,
                  Color.fromARGB(255, 255, 0, 0),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
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
