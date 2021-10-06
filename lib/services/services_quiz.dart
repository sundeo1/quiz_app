import 'dart:convert';
import 'package:heathyent/screens/utilits/models/quiz_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

Future fetchData() async {
  var domainname = 'http://localhost';
  // var domainname = 'http://10.0.2.2';
  //var domainname = 'http://41.210.154.80';
  var token = '339e5c26d07a234b8bbfd3e726a0fc86';
  var functionname = 'core_course_get_courses';

  var serverurl = domainname + '/webservice/rest/server.php';
  var url = Uri.parse(serverurl);
  var data = {
    'wstoken': token,
    'wsfunction': functionname,
    'moodlewsrestformat': 'json',
    //'options[ids][0]'= 1
  };

  var response = await http.post(url, body: data);
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    print(decodedData);
  } else
    print("Error connecting to API");
}

Future<Quiz> getQuiz() async {
  var domainname = 'http://localhost';
  var serverurl = domainname + '/webservice/rest/server.php';
  // var domainname = 'http://10.0.2.2';
  //var domainname = 'http://41.210.154.80';
  var token = '339e5c26d07a234b8bbfd3e726a0fc86';
  var functionname = 'mod_quiz_get_attempt_data';
  var baseurl = serverurl +
      '?wstoken=' +
      token +
      '&wsfunction=' +
      functionname +
      '&moodlewsrestformat=json';
  var attemptid = '26';
  var page = '0';
  var arguments = '&attemptid=' + attemptid + '&page=' + page;
  var requesturl = baseurl + arguments;

  var url = Uri.parse(requesturl);

  var response = await http.post(url, body: {});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    //print(decodedData);
    print(response.body);
    return Quiz.fromJson(jsonDecode(response.body));
    //var decodedData = jsonDecode(response.body);
    //print(decodedData);
  } else
    //print("Error connecting to API");
    throw Exception('Failed to load survey');
}

Future processQuiz() async {
  var domainname = 'http://localhost';
  var serverurl = domainname + '/webservice/rest/server.php';
  // var domainname = 'http://10.0.2.2';
  //var domainname = 'http://41.210.154.80';
  var token = '339e5c26d07a234b8bbfd3e726a0fc86';
  var functionname = 'mod_quiz_get_attempt_access_information';
  // var baseurl = serverurl +
  //     '?wstoken=' +
  //     token +
  //     '&wsfunction=' +
  //     functionname +
  //     '&moodlewsrestformat=json';
  // var attemptid = '14';
  // var page = '0';
  // var arguments = '&attemptid=' + attemptid + '&page=' + page;
  // var requesturl = baseurl + arguments;

  var dats = [
    {'name': 'q22:1_answer', 'value': 2},
    {'name': 'q22:1_:sequencecheck', 'value': 1},
    {'name': 'q22:2_answer', 'value': 0},
    {'name': 'q22:2_:sequencecheck', 'value': 1},
    {'name': 'q22:3_answer', 'value': 0},
    {'name': 'q22:3_:sequencecheck', 'value': 1}
  ];

  var das = dats.toList();

  var dat = {
    'wstoken': token,
    'wsfunction': functionname,
    'moodlewsrestformat': 'json',
    'data': das,
    'attemptid': 22,
    'finishattempt': 0,
  };

  //var url = Uri.parse(requesturl);
  var url = Uri.parse(serverurl);

  var response = await http.post(
    url,
    //headers: {'Accept': 'application/json'},
    body: {
      'wstoken': token,
      'wsfunction': functionname,
      'moodlewsrestformat': 'json',
      //'quizid': 1
      //'data': dats,
      //'attemptid': 22,
      //'finishattempt': 0,
    },
  ).then((response) {
    print("Response Status: ${response.statusCode}");
    print("Response Status: ${response.body}");
  });
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    print(response.body);
    //print('Not working');
    //return Quiz.fromJson(jsonDecode(response.body));
    //var decodedData = jsonDecode(response.body);
    //print(decodedData);
  } else
    //print("Error connecting to API");
    throw Exception('Failed to load survey');
}

Future processQuizz() async {
  var domainname = 'http://localhost';
  var serverurl = domainname + '/webservice/rest/server.php';
  // var domainname = 'http://10.0.2.2';
  //var domainname = 'http://41.210.154.80';
  var token = '339e5c26d07a234b8bbfd3e726a0fc86';
  var functionname = 'mod_quiz_get_attempt_access_information';
  // var baseurl = serverurl +
  //     '?wstoken=' +
  //     token +
  //     '&wsfunction=' +
  //     functionname +
  //     '&moodlewsrestformat=json';
  // var attemptid = '14';
  // var page = '0';
  // var arguments = '&attemptid=' + attemptid + '&page=' + page;
  // var requesturl = baseurl + arguments;

  var dats = [
    {'name': 'q22:1_answer', 'value': 2},
    {'name': 'q22:1_:sequencecheck', 'value': 1},
    {'name': 'q22:2_answer', 'value': 0},
    {'name': 'q22:2_:sequencecheck', 'value': 1},
    {'name': 'q22:3_answer', 'value': 0},
    {'name': 'q22:3_:sequencecheck', 'value': 1}
  ];

  var das = dats.toList();

  Response response;
  var dio = Dio();
  var dat = {
    'wstoken': token,
    'wsfunction': functionname,
    'moodlewsrestformat': 'json',
    'data': das,
    'attemptid': 22,
    'finishattempt': 0,
  };

  //var url = Uri.parse(requesturl);
  var url = Uri.parse(serverurl);

  response = await dio.post(
    serverurl,
    //headers: {'Accept': 'application/json'},
    data: {
      'wstoken': token,
      'wsfunction': functionname,
      'moodlewsrestformat': 'json',
      //'quizid': 1
      //'data': dats,
      //'attemptid': 22,
      //'finishattempt': 0,
    },
  ).then((response) {
    print("Response Status: ${response.statusCode}");
    print("Response Status: ${response.data}");
    return jsonDecode(response.data);
  });
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.data);
    print(response.data);
    //print('Not working');
    //return jsonDecode(response.data);
    //var decodedData = jsonDecode(response.body);
    //print(decodedData);
  } else
    //print("Error connecting to API");
    throw Exception('Failed to load survey');
}

// Get courses
Future getCourses() {
  var functionname = 'core_course_get_courses';
  //var courseid = '2';
  //var attemptid = '2'; attempt id, 0 for the user last attempt if exists
  //var arguments = '';
  var arguments = '&options[ids][0]=2';

  return fetchQuiz(functionname, arguments);
}

//Return access information for a given attempt in a quiz.
Future getAttemptAccessInfo() {
  var functionname = 'mod_quiz_get_attempt_access_information';
  var quizid = '1';
  //var attemptid = '2'; attempt id, 0 for the user last attempt if exists
  var arguments = '&quizid=' + quizid;

  return fetchQuiz(functionname, arguments);
}

//Returns information for the given attempt page for a quiz attempt in progress.
Future getAttemptData() {
  var functionname = 'mod_quiz_get_attempt_data';
  var attemptid = '22';
  var page = '0';
  var arguments = '&attemptid=' + attemptid + '&page=' + page;

  return fetchQuiz(functionname, arguments);
}

//Returns review information for the given finished attempt, can be used by users or teachers.
Future getAttemptReview() {
  var functionname = 'mod_quiz_get_attempt_review';
  var attemptid = '4';
  //var page = '1';
  var arguments = '&attemptid=' + attemptid;

  return fetchQuiz(functionname, arguments);
}

//Returns a summary of a quiz attempt before it is submitted.
Future getAttemptSummary() {
  var functionname = 'mod_quiz_get_attempt_summary';
  var attemptid = '9';
  //var preflightdata = ''; //Optional
  var arguments = '&attemptid=' + attemptid;

  return fetchQuiz(functionname, arguments);
}

//Combines the review options from a number of different quiz attempts.
Future getCombinedReviewOptions() {
  var functionname = 'mod_quiz_get_combined_review_options';
  var quizid = '1';
  var userid = '0';
  var arguments = '&quizid=' + quizid + '&userid=' + userid;

  return fetchQuiz(functionname, arguments);
}

//Returns a list of quizzes in a provided list of courses, if no list is provided all quizzes that the user can view will be returned.
Future getQuizzesByCourses() {
  var functionname = 'mod_quiz_get_quizzes_by_courses';

  var course = [''];
  var courseids = course.toString();
  //var arguments = '&courseids=' + courseids;
  var arguments = '';

  return fetchQuiz(functionname, arguments);
}

//Return access information for a given quiz.
Future getQuizAccessInfo() {
  var functionname = 'mod_quiz_get_quiz_access_information';
  var quizid = '1';
  var arguments = '&quizid=' + quizid;

  return fetchQuiz(functionname, arguments);
}

//Get the feedback text that should be show to a student who got the given grade in the given quiz.
Future getQuizFeedbackForGrade() {
  var functionname = 'mod_quiz_get_quiz_feedback_for_grade';
  var quizid = '1';
  var grade = '100';
  var arguments = '&quizid=' + quizid + '&grade=' + grade;

  return fetchQuiz(functionname, arguments);
}

//Return the potential question types that would be required for a given quiz.
Future getQuizRequiredQtnTypes() {
  var functionname = 'mod_quiz_get_quiz_required_qtypes';
  var quizid = '1';
  var arguments = '&quizid=' + quizid;

  return fetchQuiz(functionname, arguments);
}

//Return a list of attempts for the given quiz and user.
Future getUserAttempts() {
  var functionname = 'mod_quiz_get_user_attempts';
  var arguments = '&quizid=1&userid=0&status=all&includepreviews=1';

  return fetchQuiz(functionname, arguments);
}

//Get the best current grade for the given user on a quiz.
Future getUserBestGrade() {
  var functionname = 'mod_quiz_get_user_best_grade';
  var arguments = '&quizid=1&userid=0&status=all&includepreviews=1';

  return fetchQuiz(functionname, arguments);
}

//Process responses during an attempt at a quiz and also deals with attempts finishing.
Future processAttempt() {
  var functionname = 'mod_quiz_process_attempt';
  var attemptid = '24';
  var finishattempt = '0';
  var timeup = '0';
  var preflightdata = '&preflightdata[0][name]= password' +
      '&preflightdata[0][value]= SUNsd@pjmj23';

  var data = '&data[0][name] = q22:1_answer' +
      '&data[0][value] = 3' +
      '&data[1][name] = q22:1_:sequencecheck' +
      '&data[1][value] = 1' +
      '&data[2][name] = q22:2_answer' +
      '&data[2][value] = 1' +
      '&data[3][name] = q22:2_:sequencecheck' +
      '&data[3][value] = 1' +
      '&data[4][name] = q22:3_answer' +
      '&data[4][value] = 1' +
      '&data[5][name] = q22:3_:sequencecheck' +
      '&data[5][value] = 1';

  var dats = [
    {'name': 'q21:1_answer', 'value': 2},
    {'name': 'q21:1_:sequencecheck', 'value': 1},
    {'name': 'q21:2_answer', 'value': 0},
    {'name': 'q21:2_:sequencecheck', 'value': 1},
    {'name': 'q21:3_answer', 'value': 0},
    {'name': 'q21:3_:sequencecheck', 'value': 1}
  ];

  var stringData = dats.join();

  //&array_name[index][parameter_name]=param

  var arguments = '&attemptid=' +
      attemptid +
      '&data[0][name]=q24:1_answer&data[0][value]=3&data[1][name]=q24:1_:sequencecheck&data[1][value]=1&data[2][name]=q24:2_answer&data[2][value]=1&data[3][name]=q24:2_:sequencecheck&data[3][value]=1&data[4][name]=q24:3_answer&data[4][value]=0&data[5][name]=q24:3_:sequencecheck&data[5][value]=1' +
      '&finishattempt=' +
      finishattempt;

  return fetchQuiz(functionname, arguments);
}

//Processes save requests during the quiz.This function is intended for the quiz auto-save feature.
Future saveAttempt() {
  var functionname = 'mod_quiz_save_attempt';
  var attemptid = '4';
  var data = '&data[0][name] = q3:1_answer' +
      '&data[0][value] = 1' +
      '&data[1][name] = q3:1_:sequencecheck' +
      '&data[1][value] = 1' +
      '&data[2][name] = q3:2_answer' +
      '&data[2][value] = 1' +
      '&data[3][name] = q3:2_:sequencecheck' +
      '&data[3][value] = 1' +
      '&data[4][name] = q3:3_answer' +
      '&data[4][value] = 1' +
      '&data[5][name] = q3:3_:sequencecheck' +
      '&data[5][value] = 1';
  //'&finishattempt = 0';
  //var preflightdata = ''; //Optional
  var arguments = '&attemptid=' + attemptid + data;

  return fetchQuiz(functionname, arguments);
}

//Starts a new attempt at a quiz.
Future startAttempt() {
  var functionname = 'mod_quiz_start_attempt';
  var quizid = '3';
  //var preflightdata = ''; //Optional
  //var forcenew = ''; //Whether to force a new attempt or not. Optional
  var arguments = '&quizid=' + quizid;

  return fetchQuiz(functionname, arguments);
}

//Trigger the attempt viewed event.
Future viewAttempt() {
  var functionname = 'mod_quiz_view_attempt';
  var attemptid = '3';
  var pagenumber = '0';
  //var preflightdata = ''; //Optional
  var arguments = '&attemptid=' + attemptid + '&page=' + pagenumber;

  return fetchQuiz(functionname, arguments);
}

//Trigger the attempt reviewed event.
Future viewAttemptReview() {
  var functionname = 'mod_quiz_view_attempt_review';
  var attemptid = '4';
  var arguments = '&attemptid=' + attemptid;

  return fetchQuiz(functionname, arguments);
}

//Trigger the attempt summary viewed event.
Future viewAttemptSummary() {
  var functionname = 'mod_quiz_view_attempt_summary';

  var attemptid = '12';
  //var preflightdata = ''; //Optional
  var arguments = '&attemptid=' + attemptid;

  return fetchQuiz(functionname, arguments);
}

//Trigger the course module viewed event and update the module completion status.
Future viewQuiz() {
  var functionname = 'mod_quiz_view_quiz';

  var quizid = '1';
  var arguments = '&quizid=' + quizid;

  return fetchQuiz(functionname, arguments);
}

//Main function to fetch data from moodle using arguments supplied.
//It takes in the particular moodle function and its arguments
Future fetchQuiz(func, args) async {
  var domainname = 'http://localhost';
  var serverurl = domainname + '/webservice/rest/server.php';
  // var domainname = 'http://10.0.2.2';
  //var domainname = 'http://41.210.154.80';
  var token = '339e5c26d07a234b8bbfd3e726a0fc86';
  var functionname = func;
  var baseurl = serverurl +
      '?wstoken=' +
      token +
      '&wsfunction=' +
      functionname +
      '&moodlewsrestformat=json';
  var arguments = args;
  var requesturl = baseurl + arguments;

  var url = Uri.parse(requesturl);

  var response = await http.post(url, body: {});
  if (response.statusCode == 200) {
    //var decodedData = jsonDecode(response.body);
    //return Quiz.fromJson(jsonDecode(response.body));
    print(response.body);
    //print(decodedData);
  } else {
    print("Error connecting to API");
  }
}
