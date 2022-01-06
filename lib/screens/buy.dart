import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:titans_crypto/models/coin_model.dart';
import 'package:titans_crypto/services/coin_service.dart';
import '../assets/constants.dart' as constants;

var logger = Logger();
const String url = constants.serverUrl;

class BuyScreen extends StatefulWidget {
  const BuyScreen({Key? key}) : super(key: key);

  @override
  _BuyScreenState createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  Future<List<Coin>>? coinData;

  @override
  void initState() {
    super.initState();
    coinData = fetchCoinDummyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1B232A),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'profileScreen');
          },
          icon: const Icon(
            Icons.account_circle_outlined,
            size: 35,
            color: Color(0xff5ED5A8),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              //Navigator.of(context).pushNamed('walletScreen');
              logger.i(coinData);
              //logger.i(await fetchCoinDummyData());
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
          child: SizedBox(
            height: 640,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 50,
                    //color: const Color(0xff161C22),
                    width: 366,
                    decoration: const BoxDecoration(
                      color: Color(0xff161C22),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          minWidth: 179,
                          height: 38,
                          onPressed: () {},
                          color: const Color(0xff1B232A),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text(
                            "Buy",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffC1C7CD)),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 179,
                          height: 38,
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('sellScreen');
                          },
                          color: const Color(0xff161C22),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text(
                            "Sell",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xff777777)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<Coin>>(
                    future: coinData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Coin>? data = snapshot.data;
                        return ListView.builder(
                          itemCount: data?.length,
                          itemBuilder: (context, index) {
                            Color marketColor;
                            String marketImage;
                            if ((data?[index].changePercentage ?? 0) >= 0) {
                              marketColor = const Color(0xff5ED5A8);
                              marketImage = "assets/images/increasing.png";
                            } else {
                              marketColor = const Color(0xffDD4B4B);
                              marketImage = "assets/images/decreasing.png";
                            }
                            return Container(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 29, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                    data?[index].image ?? '',
                                    height: 44,
                                    width: 44,
                                  ),
                                  const SizedBox(
                                    width: 13,
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data?[index].name ?? '',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          data?[index].symbol?.toUpperCase() ??
                                              '',
                                          style: const TextStyle(
                                            color: Color(0xff777777),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Center(
                                    child: Image.asset(
                                      marketImage,
                                      height: 33,
                                      width: 93,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          data?[index]
                                                  .currentPrice
                                                  .toString() ??
                                              '',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          data?[index]
                                                  .changePercentage
                                                  ?.toStringAsFixed(2) ??
                                              '',
                                          style: TextStyle(
                                            color: marketColor,
                                            fontSize: 16,
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
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
