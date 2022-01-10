import 'package:flutter/material.dart';
import 'package:titans_crypto/models/coin_holding.dart';
import 'package:titans_crypto/models/coin_model.dart';
import 'package:titans_crypto/screens/coin_selling.dart';
import 'package:titans_crypto/services/coin_holding_service.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  Future<List<CoinHolding>>? coinHoldingData;

  @override
  void initState() {
    super.initState();
    coinHoldingData = getCoinHolding();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CoinHolding>>(
      future: coinHoldingData,
      builder: (context, snapshot) {
        if(snapshot.hasData && (snapshot.data?.isEmpty ?? false)){
          return const Center(
            child: Text(
              'No Coins To Sell',
              style: TextStyle(
                color: Color(0xff777777),
                fontSize: 25,
              ),
            ),
          );
        }
        else if (snapshot.hasData) {
          List<CoinHolding>? data = snapshot.data;
          return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              Coin? coin = data?[index].coin;
              Color marketColor;
              String marketImage;

              if ((coin?.changePercentage ?? 0) >= 0) {
                marketColor = const Color(0xff5ED5A8);
                marketImage = "assets/images/increasing.png";
              } else {
                marketColor = const Color(0xffDD4B4B);
                marketImage = "assets/images/decreasing.png";
              }
              num? price = coin?.currentPrice;
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
                            CoinSelling(coinHolding: data?[index]),
                      ),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        coin?.image ?? '',
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
                              coin?.name ?? '',
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
                              coin?.symbol?.toUpperCase() ?? '',
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
                              coin?.changePercentage
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
