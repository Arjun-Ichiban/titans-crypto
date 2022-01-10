import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:titans_crypto/screens/sell.dart';
import 'package:titans_crypto/screens/buy.dart';

var logger = Logger();

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  int _selectedWidget = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    BuyScreen(),
    SellScreen()
  ];

  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: const Color(0xff161C22)),
          child: Center(
            child: ToggleButtons(
              children: const [
                InkWell(
                  child: Center(
                    child: Text(
                      "Buy",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xffC1C7CD)),
                    ),
                  ),
                ),
                InkWell(
                  child: Center(
                    child: Text(
                      "Sell",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xffC1C7CD)),
                    ),
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = !isSelected[buttonIndex];
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                  _selectedWidget = index;
                });
              },
              isSelected: isSelected,
              color: const Color(0xff161C22),
              fillColor: const Color(0xff1B232A),
              //fillColor: Colors.white,
              constraints: const BoxConstraints(
                minWidth: 169,
                minHeight: 36,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 520,
          child: _widgetOptions.elementAt(_selectedWidget),
        ),
      ],
    );
  }
}
