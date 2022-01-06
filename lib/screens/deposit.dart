import 'package:flutter/material.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
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
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top:10),
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
                          Text(
                            "\u{20B9} 40,095.00",
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: Icon(
                    Icons.arrow_circle_up_sharp,
                    size: 100,
                    color: const Color(0xff5ED5A8),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Text(
                    'Amount',
                    style: TextStyle(
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff5ED5A8),
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, right: 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: const Color(0xff161C22),
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        decoration: InputDecoration(
                          label: Text(
                            'Enter The Amount',
                            style: TextStyle(
                              fontFamily: 'montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: const Color(0xff777777),
                            ),
                          ),
                          border: InputBorder.none,
                          fillColor: const Color(0xff161C22),
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: MaterialButton(
                    minWidth: 200,
                    height: 60,
                    onPressed: () {
                    },
                    color: const Color(0xff5ED5A8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: const Text(
                      "Deposit",
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.black),
                    ),
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
