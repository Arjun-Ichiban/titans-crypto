import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:titans_crypto/services/balance_service.dart';
import 'package:titans_crypto/services/transaction_service.dart' as transaction;
import 'package:titans_crypto/widgets/dialog_widget.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  Future<String>? walletBalance;

  @override
  void initState() {
    super.initState();
    walletBalance = getWalletBalance();
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
                                logger.i(data);
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
                  height: 60,
                ),
                Center(
                  child: Icon(
                    Icons.arrow_circle_down_sharp,
                    size: 100,
                    color: const Color(0xffDD4B4B),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
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
                FutureBuilder<String>(
                  future: walletBalance,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      String? data = snapshot.data;
                      return TransactionForm(balance: data);
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
          ),
        ),
      ),
    );
  }
}

class TransactionForm extends StatefulWidget {
  final String? balance;

  const TransactionForm({Key? key, this.balance}) : super(key: key);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  num? amount = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Container(
              padding: EdgeInsets.only(left: 5),
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                initialValue: '0',
                validator: (value) {
                  if (value == '') {
                    return 'Amount cannot be empty';
                  } else if (value != null &&
                      double.parse(value) >
                          double.parse(widget.balance ?? '0')) {
                    return 'Amount cannot be greater than balance';
                  } else if (value == '') {
                    return 'Amount cannot be empty';
                  } else if (value == '0') {
                    return 'Amount cannot be 0';
                  }
                  return null;
                },
                onSaved: (value) {
                  amount = double.parse(value ?? '0');
                },
                decoration: const InputDecoration(
                  label: Text(
                    'Enter The Amount',
                    style: TextStyle(
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xff777777),
                    ),
                  ),
                  helperText: ' ',
                  border: InputBorder.none,
                  fillColor: Color(0xff161C22),
                  filled: true,
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
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  logger.i([amount]);
                  bool status = await transaction.walletTransaction(
                      context, amount, 'withdraw');
                  showMyDialog(context);
                }
              },
              color: const Color(0xff5ED5A8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: const Text(
                "Withdraw",
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
    );
  }
}
