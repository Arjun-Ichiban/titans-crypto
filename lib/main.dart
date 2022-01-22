import 'package:flutter/material.dart';
import 'package:titans_crypto/screens/deposit.dart';
import 'package:titans_crypto/screens/activity.dart';
import 'package:titans_crypto/screens/buy.dart';
import 'package:titans_crypto/screens/main_screen.dart';
import 'package:titans_crypto/screens/market.dart';
import 'package:titans_crypto/screens/profile.dart';
import 'package:titans_crypto/screens/sell.dart';
import 'package:titans_crypto/screens/signIn.dart';
import 'package:titans_crypto/screens/signUp.dart';
import 'package:titans_crypto/screens/balance.dart';
import 'package:titans_crypto/screens/transaction_report.dart';
import 'package:titans_crypto/screens/wallet_transaction.dart';
import 'package:titans_crypto/screens/welcome.dart';
import 'package:titans_crypto/screens/withdraw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titans Crypto',
      theme: ThemeData(
        primaryColor: const Color(0xff5ED5A8),
        scaffoldBackgroundColor: const Color(0xff1B232A),
      ),
      home: const WelcomeScreen(),
      routes: {
        'welcomeScreen': (context) => WelcomeScreen(),
        'signInScreen': (context) => SignInScreen(),
        'signUpScreen': (context) => SignUpScreen(),
        'mainScreen': (context) => MainScreen(),
        'marketScreen': (context) => MarketScreen(),
        'buyScreen': (context) => BuyScreen(),
        'sellScreen': (context) => SellScreen(),
        'walletScreen': (context) => WalletScreen(),
        'activityScreen': (context) => ActivityScreen(),
        'profileScreen': (context) => ProfileScreen(),
        'depositScreen': (context) => DepositScreen(),
        'withdrawScreen': (context) => WithdrawScreen(),
        'walletTransactionScreen': (context) => WalletTransactionScreen(),
        'transactionReportScreen': (context) => TransactionReportScreen(),
      },
    );
  }
}
