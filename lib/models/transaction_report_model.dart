import 'package:charts_flutter/flutter.dart' as charts;

class TransactionReport {
  final String? transType;
  num? totalAmount;
  String? totalCount;
  final charts.Color? barColor;

  TransactionReport(
      {this.transType, this.totalAmount, this.totalCount, this.barColor});
}
