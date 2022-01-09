import 'package:flutter/material.dart';
import 'package:titans_crypto/models/coin_holding.dart';
import 'package:titans_crypto/models/coin_model.dart';
import 'package:titans_crypto/services/coin_holding.dart';

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
            color: Color(0xff5ED5A8),
          ),
        ),
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
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('buyScreen');
                          },
                          color: const Color(0xff161C22),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text(
                            "Buy",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xff777777)),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 179,
                          height: 38,
                          onPressed: () {},
                          color: const Color(0xff1B232A),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text(
                            "Sell",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffC1C7CD)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<CoinHolding>>(
                    future: coinHoldingData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
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
                                // if (data?[index] != null) {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           CoinBuying(coin: data?[index]),
                                //     ),
                                //   );
                                // }
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 15, right: 20, bottom: 15),
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
