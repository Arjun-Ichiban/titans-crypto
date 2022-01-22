import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:titans_crypto/models/transaction_report_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../assets/constants.dart' as constants;

var logger = Logger();
const String url = constants.serverUrl;

Future<List<TransactionReport>> transactionReport() async {
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt('user_id') ?? 0;
  final http.Response response = await http.get(
      Uri.parse(url + "/user/$userId/transaction-report"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);

    List<TransactionReport> trans = [
      TransactionReport(
          transType: 'Buying',
          totalAmount: 0,
          totalCount: '0',
          barColor: charts.ColorUtil.fromDartColor(Colors.green)),
      TransactionReport(
          transType: 'Selling',
          totalAmount: 0,
          totalCount: '0',
          barColor: charts.ColorUtil.fromDartColor(Colors.red)),
      TransactionReport(
          transType: 'Deposit',
          totalAmount: 0,
          totalCount: '0',
          barColor: charts.ColorUtil.fromDartColor(Colors.green)),
      TransactionReport(
          transType: 'Withdraw',
          totalAmount: 0,
          totalCount: '0',
          barColor: charts.ColorUtil.fromDartColor(Colors.red))
    ];

    //for Map<String, Dynamic> jsonData in jsonResponse{
    for (var element in jsonResponse) {
      if (element['trans_type'] == 'buy') {
        trans[0].totalAmount = element['total_sum'];
        trans[0].totalCount = element['total_count'];
      } else if (element['trans_type'] == 'sell') {
        trans[1].totalAmount = element['total_sum'];
        trans[1].totalCount = element['total_count'];
      } else if (element['trans_type'] == 'deposit') {
        trans[2].totalAmount = element['total_sum'];
        trans[2].totalCount = element['total_count'];
      } else {
        trans[3].totalAmount = element['total_sum'];
        trans[3].totalCount = element['total_count'];
      }
    }

    return trans;
  } else {
    throw Exception('Unexpected error occurred!');
  }
}
