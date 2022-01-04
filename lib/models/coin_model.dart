import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import '../assets/constants.dart' as constants;

var logger = Logger();
const String apiKey = constants.apiKey;

class Coin {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final num? currentPrice;
  final num? changePercentage;

  Coin(
      {this.id,
      this.symbol,
      this.name,
      this.image,
      this.currentPrice,
      this.changePercentage});

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      image: json['image'],
      currentPrice: json['current_price'],
      changePercentage: json['market_cap_change_percentage_24h'],
    );
  }
}

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
