import 'coin_model.dart';

class CoinHolding {
  final Coin? coin;
  final num? noOfCoins;

  CoinHolding(
      {this.coin,
      this.noOfCoins,});

  factory CoinHolding.fromJson(
      Map<String, dynamic> json, Map<String, dynamic> coinData) {
    return CoinHolding(
      coin: coinData[json['coin_id']],
      noOfCoins: json['no_of_coins'],
    );
  }
}
