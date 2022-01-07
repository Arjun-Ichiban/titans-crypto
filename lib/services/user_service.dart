import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:titans_crypto/models/user_model.dart';
import '../assets/constants.dart' as constants;

var logger = Logger();
const String url = constants.serverUrl;

Future<User> getUserDetails() async {
  logger.i('yes');
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt('user_id') ?? 0;
  final http.Response response = await http.get(
      Uri.parse(url + "/user/$userId/user-details"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
  );
  if (response.statusCode == 200) {
    logger.i(response.body);
    Map<String, dynamic> res = jsonDecode(response.body);
    return User.fromJson(res);
  } else {
    throw Exception('Unexpected error occurred!');
  }
}