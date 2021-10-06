import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:heathyent/services/services_quiz.dart';
import 'models/quiz_model.dart';

enum SingingCharacter { lafayette, jefferson }

class HtmlPage extends StatefulWidget {
  HtmlPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HtmlPageState createState() => _HtmlPageState();
}

class _HtmlPageState extends State<HtmlPage> {
  @override
  Widget build(BuildContext context) {
    SingingCharacter _character = SingingCharacter.lafayette;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Card(
              child: FutureBuilder<Quiz>(
                  future: getQuiz(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                          child: Text('Loading...'),
                        ),
                      );
                    } else
                      return ListView.builder(
                          padding: const EdgeInsets.all(10.0),
                          itemCount: snapshot.data.questions.length + 1,
                          itemBuilder: (context, index) {
                            if (index.isOdd) return Divider();
                            //return Text(snapshot.data[index].fullname);
                            return ListTile(
                              title: Question(
                                question: snapshot.data.questions[index].html,
                              ),
                              subtitle:
                                  Text(snapshot.data.questions[index].type),
                              trailing: ListTile(
                                title: const Text('Lafayette'),
                                leading: Radio<SingingCharacter>(
                                  value: SingingCharacter.lafayette,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                              // ListTile(
                              //   title: const Text('Thomas Jefferson'),
                              //   leading: Radio<SingingCharacter>(
                              //     value: SingingCharacter.jefferson,
                              //     groupValue: _character,
                              //     onChanged: (SingingCharacter value) {
                              //       setState(() {
                              //         _character = value;
                              //       });
                              //     },
                              //   ),
                              // ),,
                            );
                          });
                  })),
        ));
  }
}

class Question extends StatelessWidget {
  final question;
  const Question({
    Key key,
    this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: """<html><body>$question</body></html>""",
      //Optional parameters:
      style: {
        "html": Style(
          backgroundColor: Colors.black12,
        ),
        "table": Style(
          backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        ),
        "tr": Style(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        "th": Style(
          padding: EdgeInsets.all(6),
          backgroundColor: Colors.grey,
        ),
        "td": Style(
          padding: EdgeInsets.all(6),
        ),
        "var": Style(fontFamily: 'serif'),
      },
      customRender: {
        "flutter": (RenderContext context, Widget child, attributes, _) {
          return FlutterLogo(
            style: (attributes['horizontal'] != null)
                ? FlutterLogoStyle.horizontal
                : FlutterLogoStyle.markOnly,
            textColor: context.style.color,
            size: context.style.fontSize.size * 5,
          );
        },
      },
      // onLinkTap: (url) {
      //   print("Opening $url...");
      // },
      // onImageTap: (src) {
      //   print(src);
      // },
      onImageError: (exception, stackTrace) {
        print(exception);
      },
    );
  }
}
