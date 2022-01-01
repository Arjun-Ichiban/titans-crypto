import 'package:flutter/material.dart';
import 'package:titans_crypto/screens/buy.dart';
import 'package:titans_crypto/screens/sell.dart';
import 'package:titans_crypto/screens/signIn.dart';
import 'package:titans_crypto/screens/signUp.dart';
import 'package:titans_crypto/screens/wallet.dart';
import 'package:titans_crypto/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff5ED5A8),
        scaffoldBackgroundColor: const Color(0xff1B232A),
      ),
      home: const WelcomeScreen(),
      routes: {
        'welcomeScreen': (context) => WelcomeScreen(),
        'signInScreen': (context) => SignInScreen(),
        'signUpScreen': (context) => SignUpScreen(),
        'buyScreen': (context) => BuyScreen(),
        'sellScreen': (context) => SellScreen(),
        'walletScreen': (context) => WalletScreen(),
      },
    );
  }
}
