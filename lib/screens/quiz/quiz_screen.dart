import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heathyent/controllers/question_controller.dart';
import 'package:heathyent/screens/quiz/components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // Fluttter show the back button automatically
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip"))
          ],
        ),
        body: Body());
  }
}
