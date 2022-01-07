import 'package:flutter/material.dart';
import 'package:titans_crypto/models/wallet_transaction_model.dart';
import 'package:titans_crypto/services/balance_service.dart';
import 'package:titans_crypto/services/transaction_service.dart';

class WalletTransactionScreen extends StatefulWidget {
  const WalletTransactionScreen({Key? key}) : super(key: key);

  @override
  _WalletTransactionScreenState createState() =>
      _WalletTransactionScreenState();
}

class _WalletTransactionScreenState extends State<WalletTransactionScreen> {
  Future<String>? walletBalance;
  Future<List<WalletTransaction>>? transactionData;

  @override
  void initState() {
    super.initState();
    walletBalance = getWalletBalance();
    transactionData = walletTransactionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1B232A),
        leading: IconButton(
          padding: EdgeInsets.only(left: 12),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 35,
            color: Color(0xff5ED5A8),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 630,
            width: MediaQuery.of(context).size.width - 20,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff161C22),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          size: 70,
                          color: const Color(0xff5ED5A8),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wallet Balance",
                              style: TextStyle(
                                fontSize: 20,
                                color: const Color(0xff777777),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            FutureBuilder<String>(
                              future: walletBalance,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  String? data = snapshot.data;
                                  return Text(
                                    "\u{20B9} ${data ?? 0}",
                                    style: TextStyle(
                                      fontSize: 34,
                                      color: Colors.white,
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(
                                    'error',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  );
                                }
                                // By default, show a loading spinner.
                                return const CircularProgressIndicator();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: FutureBuilder<List<WalletTransaction>>(
                      future: transactionData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<WalletTransaction>? data = snapshot.data;
                          return ListView.builder(
                            itemCount: data?.length,
                            itemBuilder: (context, index) {
                              Color transactionColor;
                              IconData transactionIcon;

                              if ((data?[index].type ?? '') == 'deposit') {
                                transactionColor = const Color(0xff5ED5A8);
                                transactionIcon = Icons.south_west_sharp;
                              } else {
                                transactionColor = const Color(0xffDD4B4B);
                                transactionIcon = Icons.north_east_sharp;
                              }
                              return Container(
                                padding:
                                    const EdgeInsets.only(top: 29, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      transactionIcon,
                                      size: 40,
                                      color: transactionColor,
                                    ),
                                    const SizedBox(
                                      width: 13,
                                    ),
                                    SizedBox(
                                      width: 220,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data?[index].type?.toUpperCase() ??
                                                '',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: transactionColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            data?[index].date ?? '',
                                            style: const TextStyle(
                                              color: Color(0xff777777),
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "\u{20B9} ${data?[index].amount.toString() ?? ''}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: transactionColor,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
