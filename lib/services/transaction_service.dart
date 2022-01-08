import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:titans_crypto/models/wallet_transaction_model.dart';
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
    return false;
  }
}

Future<List<WalletTransaction>> walletTransactionList() async {
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt('user_id') ?? 0;
  final http.Response response = await http.get(
      Uri.parse(url + "/user/$userId/wallet-transaction-list"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((data) => WalletTransaction.fromJson(data))
        .toList();
  } else {
    throw Exception('Unexpected error occurred!');
  }
}

Future<bool> coinTransaction(
    context, coinId, amount, noOfCoins, transType, imageUrl) async {
  logger.i([coinId, amount, noOfCoins, transType, imageUrl]);
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt('user_id') ?? 0;
  final http.Response response = await http.post(
    Uri.parse(url + "/user/$userId/coin-transaction"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'coin_id': coinId,
      'amount': amount,
      'no_of_coins': noOfCoins,
      'type': transType,
      'image_url': imageUrl
    }),
  );
  if (response.statusCode == 200) {
    logger.i('Transaction successful');
    return true;
  } else {
    logger.e('Transaction Failed');
    return false;
  }
}
