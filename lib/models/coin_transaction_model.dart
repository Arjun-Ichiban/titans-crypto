class CoinTransaction {
  final num? transId;
  final num? amount;
  final num? noOfCoins;
  final String? type;
  final String? date;
  final String? symbol;
  final String? imageUrl;

  CoinTransaction({
    this.transId,
    this.amount,
    this.noOfCoins,
    this.type,
    this.date,
    this.symbol,
    this.imageUrl
  });

  factory CoinTransaction.fromJson(Map<String, dynamic> json) {
    return CoinTransaction(
      transId: json['trans_id'],
      amount: json['trans_amt'],
      noOfCoins: json['no_of_coins'],
      type: json['trans_type'],
      date: json['trans_date'],
      symbol: json['coin_symbol'],
      imageUrl: json['image_url']
    );
  }
}
