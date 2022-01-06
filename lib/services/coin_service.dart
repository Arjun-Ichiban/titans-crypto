import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:titans_crypto/models/coin_model.dart';
import '../assets/constants.dart' as constants;

var logger = Logger();
const String apiKey = constants.apiKey;
const String url = constants.serverUrl;

Future<List<Coin>> fetchData() async {
  final http.Response response = await http.get(
    Uri.parse('https://coingecko.p.rapidapi.com/coins/markets').replace(
        queryParameters: {
          'vs_currency': 'inr',
          'page': '1',
          'per_page': '100',
          'order': 'market_cap_desc'
        }),
    headers: <String, String>{
      'x-rapidapi-host': 'coingecko.p.rapidapi.com',
      'x-rapidapi-key': apiKey
    },
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Coin.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occurred!');
  }
}

Future<List<Coin>> fetchCoinDummyData() async {
  final http.Response response = await http.get(
    Uri.parse(url + "/coin"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Coin.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occurred!');
  }
}
