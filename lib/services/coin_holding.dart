import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:titans_crypto/models/coin_holding.dart';
import 'package:titans_crypto/models/coin_model.dart';
import 'package:titans_crypto/services/balance_service.dart';
import 'package:titans_crypto/services/coin_service.dart';
import '../assets/constants.dart' as constants;

var logger = Logger();
const String url = constants.serverUrl;

Future<List<CoinHolding>> getCoinHolding() async {
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt('user_id') ?? 0;
  final http.Response response = await http.get(
      Uri.parse(url + "/user/$userId/coin-holding"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
  if (response.statusCode == 200) {
    logger.i(response.body);
    List jsonResponse = json.decode(response.body);
    List<Coin> coinData = await fetchCoinDummyData();

    Map<String, dynamic> coinMap = {
      for (var coin in coinData) '${coin.id}': coin,
    };

    return jsonResponse
        .map((data) => CoinHolding.fromJson(data, coinMap))
        .toList();
  } else {
    throw Exception('Unexpected error occurred!');
  }
}

Future<Map<String, dynamic>> getTotalBalance() async {
  try {
    List<CoinHolding> coinHolding = await getCoinHolding();

    num total = 0;
    for (var coin in coinHolding) {
      total = total + (coin.priceOfCoins ?? 0);
    }

    String rupeeBalance = await getWalletBalance();

    Map<String, dynamic> data = {};
    data['total'] = total;
    data['rupeeBalance'] = rupeeBalance;
    data['coinHolding'] = coinHolding;

    return data;
  } catch (err) {
    throw Exception('Unexpected error occurred!');
  }
}
