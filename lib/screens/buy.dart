import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:titans_crypto/models/coin_model.dart';
import 'package:titans_crypto/screens/coin_buying.dart';
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
    coinData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Coin>>(
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
              num? price = data?[index].currentPrice;
              String formattedPrice = '';
              if (price != null) {
                if (price < 10) {
                  formattedPrice = price.toStringAsFixed(5);
                } else if (price < 100) {
                  formattedPrice = price.toStringAsFixed(3);
                } else if (price < 100000) {
                  formattedPrice = price.toStringAsFixed(2);
                } else {
                  formattedPrice = price.toStringAsFixed(1);
                }
              }
              return InkWell(
                onTap: () {
                  if (data?[index] != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CoinBuying(coin: data?[index]),
                      ),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              data?[index].symbol?.toUpperCase() ?? '',
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              formattedPrice,
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
    );
  }
}
