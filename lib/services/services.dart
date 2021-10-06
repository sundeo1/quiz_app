import 'dart:convert';
import 'package:heathyent/models/courses.dart';
import 'package:http/http.dart' as http;

Future getData() async {
  var response = await http.get(Uri.https('helper.healthyentrepreneurs.nl',
      'user/get_moodle_courses/7afb8d11b501db8a6f66f0f34886d1ca'));

  var jsonData = jsonDecode(response.body);

  List<Course> courses = [];

  for (var u in jsonData) {
    Course course = Course(u["fullname"], u["source"], u["summary_custome"],
        u["next_link"], u["image_url_small"], u["image_url"]);
    courses.add(course);
  }
  print(jsonData.length);

  List<Course> origin = [];
  origin = courses.where((element) => element.source != 'moodle').toList();
  return origin;
  //return courses;
}

Future fetchData(n) async {
  var response = await http
      .get(Uri.https('helper.healthyentrepreneurs.nl', 'survey/getnexlink/'+n));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    //print(Survey.fromJson(jsonDecode(response.body)) as List);
    print(response.body);
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load survey');
  }
}
