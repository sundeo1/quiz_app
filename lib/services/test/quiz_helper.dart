import 'package:flutter/material.dart';
import 'package:heathyent/screens/utilits/toolsUtilitis.dart';
import 'package:html/dom.dart' as dom;

class QuizHelper {
  static Widget createQuestionWidget(
      Map<String, String> attributes, dom.Element element) {
    print(attributes);
    var inputType = attributes['type'];
    var labelText = element.parent.text;
    if (labelText.isEmpty) {
      labelText = attributes['value'];
    }
    if (inputType == "checkbox") {
      bool checkStatus = false;
      return customCheckbox('$labelText', checkStatus, (v) {
        print(v);
        checkStatus = v;
      });
    } else if (inputType == "text") {
      return customTextField('First name', false, (v) => {});
    } else if (inputType == "label") {
      var txt = element.text;
      return Text(
        txt,
        style: TextStyle(
            color: ToolsUtilities.mainPrimaryColor,
            fontWeight: FontWeight.w600),
      );
    } else if (inputType == "hidden") {
      return Text('');
    } else {
      return Checkbox(
        value: false,
        onChanged: (bool value) {},
      );
    }
  }
}
