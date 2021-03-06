import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/welcome.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 230,
              ),
              const Center(
                child: Text(
                  "Welcome To",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 29,
                      color: Color(0xff5ED5A8)),
                ),
              ),
              const SizedBox(
                height: 220,
              ),
              Center(
                child: MaterialButton(
                  minWidth: 260,
                  height: 60,
                  onPressed: () {
                    Navigator.pushNamed(context, 'signInScreen');
                  },
                  color: const Color(0xff5ED5A8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: MaterialButton(
                  minWidth: 260,
                  height: 60,
                  onPressed: () {
                    Navigator.pushNamed(context, 'signUpScreen');
                  },
                  color: const Color(0xff5ED5A8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
