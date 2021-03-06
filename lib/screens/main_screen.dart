import 'package:flutter/material.dart';
import 'package:titans_crypto/screens/activity.dart';
import 'package:titans_crypto/screens/market.dart';
import 'package:titans_crypto/screens/balance.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    //BuyScreen(),
    MarketScreen(),
    WalletScreen(),
    ActivityScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1B232A),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'profileScreen');
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
              child: _widgetOptions.elementAt(_selectedIndex)),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color(0xff777777),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_sharp),
            label: 'Balance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_sharp),
            label: 'Activity',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xff5ED5A8),
        backgroundColor: const Color(0xff1B232A),
      ),
    );
  }
}
