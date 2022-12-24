// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:firstui_project/Login/letsgo.dart';
import 'package:firstui_project/User%20Providers/signprovider.dart';
import 'package:firstui_project/Splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignProvider>(
      create: (context) {
        return SignProvider();
       
      },
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Prompt',
        ),
        home: Splash(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
