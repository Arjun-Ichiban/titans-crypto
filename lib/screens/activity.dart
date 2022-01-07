import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
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
            Icons.account_circle_outlined,
            size: 35,
            color: Color(0xff5ED5A8),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xff161C22),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            "assets/images/deposit.png",
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Deposit",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff777777),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('depositScreen');
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                              size: 30,
                              color: Color(0xff009059),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            "assets/images/withdraw.png",
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Withdraw",
                            style: TextStyle(
                              fontSize: 18,
                              color: const Color(0xff777777),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('withdrawScreen');
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                              size: 30,
                              color: Color(0xff009059),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            "assets/images/transaction.png",
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Transaction",
                            style: TextStyle(
                              fontSize: 18,
                              color: const Color(0xff777777),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                              size: 30,
                              color: Color(0xff009059),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Text(
                    "Recent Activity",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemBuilder: (context, position) {
                      return Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  "BTC/INR",
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
                                  "Amount",
                                  style: TextStyle(
                                    color: Color(0xff777777),
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Price",
                                  style: TextStyle(
                                    color: Color(0xff777777),
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Status",
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
                                  "2021-08-02 04:39:26",
                                  style: TextStyle(
                                    color: Color(0xff777777),
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "0.49975",
                                  style: TextStyle(
                                    color: Color(0xff5ED5A8),
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "2652.00",
                                  style: TextStyle(
                                    color: Color(0xff777777),
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Buy",
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
    );
  }
}
