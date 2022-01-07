import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../assets/constants.dart' as constants;

var logger = Logger();
const String url = constants.serverUrl;

Future<bool> walletTransaction(context, amount, transType) async {
  logger.i([amount, transType]);
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt('user_id') ?? 0;
  final http.Response response = await http.post(
    Uri.parse(url + "/user/$userId/wallet-transaction"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({'amount': amount, 'type': transType}),
  );
  if (response.statusCode == 200) {
    logger.i('Transaction successful');
    return true;
  } else {
    logger.e('Transaction Failed');
    //ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return false;
  }
}
