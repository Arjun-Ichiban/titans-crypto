import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:titans_crypto/models/coin_holding.dart';
import 'package:titans_crypto/services/coin_holding_service.dart';

var logger = Logger();

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  Future<Map<String, dynamic>>? totalCurrentBalance;

  @override
  void initState() {
    super.initState();
    totalCurrentBalance = getTotalBalance();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: totalCurrentBalance,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic>? data = snapshot.data;
          String? rupeeBalance = data?['rupeeBalance'];
          double total = data?['total'] + (double.parse(rupeeBalance ?? '0'));
          List<CoinHolding>? coinHolding = data?['coinHolding'];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Balance",
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xff777777),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "\u{20B9} ${total.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 29),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/rupee.png",
                      height: 42,
                      width: 42,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Rupee",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "INR",
                          style: TextStyle(
                            color: Color(0xff777777),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      rupeeBalance ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                "Coin Balance",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff777777),
                ),
              ),
              SizedBox(
                height: 450,
                child:  ListView.builder(
                  itemCount: coinHolding?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            coinHolding?[index].coin?.image ?? '',
                            height: 42,
                            width: 42,
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                coinHolding?[index].coin?.name ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                coinHolding?[index]
                                        .coin
                                        ?.symbol
                                        ?.toUpperCase() ??
                                    '',
                                style: TextStyle(
                                  color: Color(0xff777777),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                coinHolding?[index].noOfCoins.toString() ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "\u{20B9} ${coinHolding?[index].priceOfCoins?.toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: Color(0xff777777),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),

              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
