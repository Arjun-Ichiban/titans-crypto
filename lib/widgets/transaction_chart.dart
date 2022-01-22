import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:titans_crypto/models/transaction_report_model.dart';

class TransactionBarChart extends StatefulWidget {
  const TransactionBarChart({Key? key, required this.barChartData})
      : super(key: key);

  final List<TransactionReport> barChartData;

  @override
  _TransactionBarChartState createState() => _TransactionBarChartState();
}

class _TransactionBarChartState extends State<TransactionBarChart> {
  List<charts.Series<TransactionReport, String>> chartData = [];

  @override
  void initState() {
    super.initState();
    chartData = _createData();
  }

  List<charts.Series<TransactionReport, String>> _createData() {
    final data = widget.barChartData;

    return [
      charts.Series<TransactionReport, String>(
        id: 'Sales',
        colorFn: (TransactionReport value, __) =>
            value.barColor ?? charts.ColorUtil.fromDartColor(Colors.blue),
        domainFn: (TransactionReport value, _) => value.transType ?? '',
        measureFn: (TransactionReport value, _) => value.totalAmount,
        data: data,
        labelAccessorFn: (TransactionReport value, _) =>
            '\u{20B9}${value.totalAmount?.toStringAsFixed(0)}',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      chartData,
      animate: true,
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            fontSize: 16,
            color: charts.ColorUtil.fromDartColor(const Color(0xffC1C7CD)),
          ),
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        showAxisLine: true,
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            fontSize: 16,
            color: charts.ColorUtil.fromDartColor(const Color(0xffC1C7CD)),
          ),
        ),
      ),
      barRendererDecorator: charts.BarLabelDecorator<String>(
        outsideLabelStyleSpec: charts.TextStyleSpec(
          color: charts.ColorUtil.fromDartColor(
            Colors.white,
          ),
        ),
        insideLabelStyleSpec: charts.TextStyleSpec(
          color: charts.ColorUtil.fromDartColor(
            Colors.white,
          ),
        ),
      ),
    );
  }
}
