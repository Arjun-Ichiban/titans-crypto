import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../assets/constants.dart' as constants;

var logger = Logger();
const String url = constants.serverUrl;

Future<String> getWalletBalance() async {
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt('user_id') ?? 0;
  final http.Response response = await http.get(
    Uri.parse(url + "/user/$userId/wallet-balance"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }
  );
  if (response.statusCode == 200) {
    logger.i(response.body);
    Map<String, dynamic> res = jsonDecode(response.body);
    return res['wallet_balance'].toString();
  } else {
    throw Exception('Unexpected error occurred!');
  }
}