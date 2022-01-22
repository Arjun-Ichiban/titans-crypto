import 'package:flutter/material.dart';
import 'package:titans_crypto/models/transaction_report_model.dart';
import 'package:titans_crypto/services/transaction_report_service.dart';
import 'package:titans_crypto/widgets/transaction_chart.dart';

class TransactionReportScreen extends StatefulWidget {
  const TransactionReportScreen({Key? key}) : super(key: key);

  @override
  _TransactionReportScreenState createState() =>
      _TransactionReportScreenState();
}

class _TransactionReportScreenState extends State<TransactionReportScreen> {

  Future<List<TransactionReport>>? chartData;

  @override
  void initState() {
    super.initState();
    chartData = transactionReport();
  }

  @override
  Widget build(BuildContext context) {
    transactionReport();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1B232A),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 12),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Color(0xff5ED5A8),
          ),
        ),
        title: const Text(
          "Transaction Report",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(5),
              //color: Colors.white,
              height: 400,
              child: FutureBuilder<List<TransactionReport>>(
                future: chartData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<TransactionReport>? data = snapshot.data;
                    return TransactionBarChart(barChartData: data ?? []);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
              //child: TransactionBarChart.withSampleData(),
            ),
          ),
        ),
      ),
    );
  }
}
