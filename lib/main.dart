import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:heathyent/screens/dis.dart';
//import 'package:heathyent/screens/home.dart';
import 'package:heathyent/screens/quiz.dart';
import 'package:heathyent/screens/quiz/quiz_screen.dart';
import 'package:heathyent/screens/radioButton.dart';
import 'package:heathyent/screens/score/score_screen.dart';
import 'package:heathyent/screens/utilits/html.dart';
import 'package:heathyent/screens/welcome/welcome_screen.dart';
import 'package:heathyent/services/test/quiz_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Entrepreneurs',
      //debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      //home: QuizScreen(),
      //home: HtmlPage(title: 'Flutter Demo Home Page'),
      //home: QuizPage()
      home: MyButton(),
    );
    // return GetMaterialApp(
    //   title: 'Quiz App',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData.dark(),
    //   home: WelcomeScreen(),
    // );
  }
}
