import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
        actions: [
          IconButton(
            onPressed: () {
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
            child: Column(
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
                  "\u{20B9} 40,095.00",
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
                        "47680.00",
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
                    itemBuilder: (context, position) {
                      return Container(
                        padding:
                        const EdgeInsets.only(top: 20, right: 20),
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
                           const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "32697.00",
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
                                  "\u{20B9} 468,096.00",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
