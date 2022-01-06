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
