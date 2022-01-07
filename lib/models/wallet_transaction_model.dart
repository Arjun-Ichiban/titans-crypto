class WalletTransaction {
  final num? amount;
  final String? type;
  final String? date;

  WalletTransaction({
    this.amount,
    this.type,
    this.date,
  });

  factory WalletTransaction.fromJson(Map<String, dynamic> json) {
    return WalletTransaction(
      amount: json['trans_amt'],
      type: json['trans_type'],
      date: json['trans_date'],
    );
  }
}
