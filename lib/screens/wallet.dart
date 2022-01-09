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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1B232A),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.account_circle_outlined,
            size: 35,
            color: Color(0xff5ed5a8),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.of(context).pushNamed('activityScreen');
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 35,
              color: Color(0xff5ED5A8),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: FutureBuilder<Map<String, dynamic>>(
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
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Current Balance",
                          style: TextStyle(
                            fontSize: 16,
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
                          padding: const EdgeInsets.only(top: 29, right: 20),
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
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "INR",
                                    style: TextStyle(
                                      color: Color(0xff777777),
                                      fontSize: 14,
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
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Coin Balance",
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xff777777),
                          ),
                        ),
                        SizedBox(
                          height: 450,
                          child: ListView.builder(
                            itemCount: coinHolding?.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 20),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          coinHolding?[index].coin?.name ?? '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          coinHolding?[index]
                                                  .coin
                                                  ?.symbol
                                                  ?.toUpperCase() ??
                                              '',
                                          style: TextStyle(
                                            color: Color(0xff777777),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          coinHolding?[index].noOfCoins.toString() ??
                                              '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "\u{20B9} ${coinHolding?[index].priceOfCoins?.toStringAsFixed(2)}",
                                          style: TextStyle(
                                            color: Color(0xff777777),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ),
      ),
    );
  }
}

