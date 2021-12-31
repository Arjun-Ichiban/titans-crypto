import 'package:flutter/material.dart';
//import 'dart:convert';

class BuyScreen extends StatefulWidget {
  const BuyScreen({Key? key}) : super(key: key);

  @override
  _BuyScreenState createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  // final List<List<String>> entries = <List<String>>[
  //   ['bitcoin', 'btc', '47680.00', '-0.18%']
  // ];

  // final _info = {
  //   "id": "bitcoin",
  //   "symbol": "btc",
  //   "name": "Bitcoin",
  //   "image":
  //       "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
  //   "current_price": 47680,
  //   "market_cap": 901696812037,
  //   "market_cap_rank": 1,
  //   "fully_diluted_valuation": 1001084214499,
  //   "total_volume": 25395765143,
  //   "high_24h": 47860,
  //   "low_24h": 46224,
  //   "price_change_24h": -88.042435179777,
  //   "price_change_percentage_24h": -0.18431,
  //   "market_cap_change_24h": -2130934991.9030762,
  //   "market_cap_change_percentage_24h": -0.23577,
  //   "circulating_supply": 18915125,
  //   "total_supply": 21000000,
  //   "max_supply": 21000000,
  //   "ath": 69045,
  //   "ath_change_percentage": -30.6829,
  //   "ath_date": "2021-11-10T14:24:11.849Z",
  //   "atl": 67.81,
  //   "atl_change_percentage": 70480.35746,
  //   "atl_date": "2013-07-06T00:00:00.000Z",
  //   "roi": '',
  //   "last_updated": "2021-12-30T17:10:18.306Z",
  // };
  //
  // get info => _info;
  //
  // Map convert() {
  //   print("yes");
  //   Map<String, dynamic> coin = jsonDecode(info);
  //   print(coin);
  //   return coin;
  // }

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
                                .pushReplacementNamed('signUpScreen');
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
                  child: ListView.builder(
                    itemBuilder: (context, position) {
                      return Container(
                        padding:
                            const EdgeInsets.only(left: 20, top: 29, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                              "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
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
                                  "Bitcoin",
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
                                  "BTC",
                                  style: TextStyle(
                                    color: Color(0xff777777),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 62,
                            ),
                            Image.asset(
                              "assets/images/increasing.png",
                              height: 31,
                              width: 91,
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "47680.00",
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
                                  "-0.18%",
                                  style: TextStyle(
                                    color: Color(0xff5ED5A8),
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
