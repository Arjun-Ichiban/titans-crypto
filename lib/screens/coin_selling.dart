import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:titans_crypto/assets/constants.dart';
import 'package:titans_crypto/models/coin_holding.dart';
import 'package:titans_crypto/models/coin_model.dart';
import 'package:titans_crypto/widgets/dialog_widget.dart';
import 'package:titans_crypto/services/transaction_service.dart' as transaction;

class CoinSelling extends StatefulWidget {
  const CoinSelling({Key? key, required this.coinHolding}) : super(key: key);

  final CoinHolding? coinHolding;

  @override
  _CoinSellingState createState() => _CoinSellingState();
}

class _CoinSellingState extends State<CoinSelling> {
  @override
  Widget build(BuildContext context) {
    final CoinHolding? coinHolding = widget.coinHolding;
    final Coin? coin = coinHolding?.coin;
    Color percentageColor;
    IconData percentageIcon;
    if ((coin?.changePercentage ?? 0) < 0) {
      percentageColor = decreaseColor;
      percentageIcon = Icons.arrow_drop_down_sharp;
    } else {
      percentageColor = increaseColor;
      percentageIcon = Icons.arrow_drop_up_sharp;
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1B232A),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Color(0xff5ED5A8),
          ),
        ),
        title: Text(
          '${coin?.symbol?.toUpperCase() ?? ''} / INR',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    coin?.image ?? '',
                    height: 70,
                    width: 70,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    '${coin?.name ?? ''} (${coin?.symbol?.toUpperCase() ?? ''})',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      '\u{20B9} ${coin?.currentPrice.toString() ?? ''}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      percentageIcon,
                      color: percentageColor,
                      size: 35,
                    ),
                    Text(
                      coin?.changePercentage?.toStringAsFixed(2) ?? '',
                      style: TextStyle(
                        color: percentageColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Holding',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff777777),
                        fontSize: 17,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${coinHolding?.noOfCoins.toString() ?? ''} ${coin?.symbol?.toUpperCase()}',
                      style: const TextStyle(
                        color: Color(0xff777777),
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SellingForm(coinHolding: coinHolding),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Coin Performance',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff777777),
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      '24H High',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff777777),
                        fontSize: 17,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\u{20B9} ${coin?.currentPrice.toString() ?? ''}',
                      style: TextStyle(
                        color: const Color(0xff777777),
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  height: 30,
                  thickness: 0.7,
                ),
                Row(
                  children: [
                    Text(
                      '24H Low',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff777777),
                        fontSize: 17,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\u{20B9} ${coin?.currentPrice.toString() ?? ''}',
                      style: const TextStyle(
                        color: Color(0xff777777),
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SellingForm extends StatefulWidget {
  const SellingForm({Key? key, required this.coinHolding}) : super(key: key);

  final CoinHolding? coinHolding;

  @override
  _SellingFormState createState() => _SellingFormState();
}

class _SellingFormState extends State<SellingForm> {
  final _formKey = GlobalKey<FormState>();

  num? amount = 0;
  num? noOfCoins = 0;

  final inrController = TextEditingController();
  final coinController = TextEditingController();

  @override
  void dispose() {
    inrController.dispose();
    coinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Coin? coin = widget.coinHolding?.coin;
    num? price = coin?.currentPrice;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5, top: 20, right: 20),
            child: TextFormField(
              controller: coinController,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
              onChanged: (value) {
                if (value != '') {
                  setState(() {
                    inrController.text =
                        (double.parse(value) * (price ?? 0)).toStringAsFixed(2);
                  });
                }
              },
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Cannot be empty';
                } else if (value == '0') {
                  return 'Cannot be 0';
                } else if(double.parse(value) > (widget.coinHolding?.noOfCoins ?? 0)){
                  return 'Not enough coins to sell';
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text(
                  'In ${coin?.symbol?.toUpperCase()}',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
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
          Container(
            padding: const EdgeInsets.only(left: 5, top: 5, right: 20),
            child: TextFormField(
              controller: inrController,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              onChanged: (value) {
                if (value != '') {
                  setState(() {
                    coinController.text =
                        (double.parse(value) / (price ?? 0)).toStringAsFixed(7);
                  });
                }
              },
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Cannot be empty';
                } else if (value == '0') {
                  return 'Cannot be 0';
                } else if(double.parse(value) > (widget.coinHolding?.priceOfCoins ?? 0)){
                  return 'Not enough coins to sell';
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text(
                  'In Rupees',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
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
          SizedBox(
            height: 20,
          ),
          Center(
            child: MaterialButton(
              minWidth: 200,
              height: 60,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  amount = double.parse(inrController.text);
                  noOfCoins = double.parse(coinController.text);
                  bool status = await transaction.coinTransaction(
                      context,
                      coin?.id,
                      amount,
                      noOfCoins,
                      'sell',
                      coin?.name,
                      coin?.symbol,
                      coin?.image);
                  if (status) {
                    showMyDialog(context);
                  }
                }
              },
              color: const Color(0xff5ED5A8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: const Text(
                "SELL",
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
