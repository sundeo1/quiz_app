import 'package:flutter/material.dart';
import 'package:heathyent/screens/dis.dart';
import '../services/services_quiz.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Card(
            child: FutureBuilder(
                future: startAttempt(),
                builder: (context, snapshot) {
                  return Container(
                    child: Center(
                      child: Text('Loading....'),
                    ),
                  );
                }),
          ),
        ));
  }
}
