class TransactionReport {
  final String? transType;
  num? totalAmount;
  String? totalCount;

  TransactionReport({
    this.transType,
    this.totalAmount,
    this.totalCount,
  });

  factory TransactionReport.fromJson(Map<String, dynamic> json) {
    return TransactionReport(
      transType: json['trans_type'],
      totalAmount: json['total_sum'],
      totalCount: json['total_count'],
    );
  }
}
