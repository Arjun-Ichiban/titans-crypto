import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../assets/constants.dart' as constants;

var logger = Logger();
const String url = constants.serverUrl;

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    height: 50,
                    //color: const Color(0xff161C22),
                    width: 366,
                    decoration: const BoxDecoration(
                      color: Color(0xff161C22),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          minWidth: 179,
                          height: 38,
                          onPressed: () {},
                          color: const Color(0xff1B232A),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffC1C7CD)),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 179,
                          height: 38,
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('signUpScreen');
                          },
                          color: const Color(0xff161C22),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xff777777)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 17, top: 35),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: SignInForm(),
                  // child: Column(
                  //   children: [
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         const Text(
                  //           "Email",
                  //           style: TextStyle(
                  //             color: Color(0xffA7AFB7),
                  //             fontSize: 16,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           height: 20,
                  //         ),
                  //         TextField(
                  //           style: const TextStyle(
                  //             color: Colors.white,
                  //           ),
                  //           onChanged: (value) {},
                  //           cursorColor: const Color(0xff5ED5A8),
                  //           decoration: InputDecoration(
                  //             hintText: 'Enter Your Email',
                  //             hintStyle:
                  //                 const TextStyle(color: Color(0xff777777)),
                  //             fillColor: const Color(0xff161C22),
                  //             filled: true,
                  //             contentPadding: const EdgeInsets.symmetric(
                  //                 vertical: 0, horizontal: 10),
                  //             focusedBorder: UnderlineInputBorder(
                  //               borderSide: const BorderSide(
                  //                   color: Color(0xff5ED5A8), width: 2.0),
                  //               borderRadius: BorderRadius.circular(12.0),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     const SizedBox(
                  //       height: 40,
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         const Text(
                  //           "Password",
                  //           style: TextStyle(
                  //             color: Color(0xffA7AFB7),
                  //             fontSize: 16,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           height: 20,
                  //         ),
                  //         TextField(
                  //           style: const TextStyle(
                  //             color: Colors.white,
                  //           ),
                  //           onChanged: (value) {},
                  //           cursorColor: const Color(0xff5ED5A8),
                  //           decoration: InputDecoration(
                  //             hintText: 'Enter Your Password',
                  //             hintStyle:
                  //                 const TextStyle(color: Color(0xff777777)),
                  //             fillColor: const Color(0xff161C22),
                  //             filled: true,
                  //             contentPadding: const EdgeInsets.symmetric(
                  //                 vertical: 0, horizontal: 10),
                  //             focusedBorder: UnderlineInputBorder(
                  //               borderSide: const BorderSide(
                  //                   color: Color(0xff5ED5A8), width: 2.0),
                  //               borderRadius: BorderRadius.circular(12.0),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ),
                // const SizedBox(
                //   height: 60,
                // ),
                // Center(
                //   child: MaterialButton(
                //     minWidth: 300,
                //     height: 60,
                //     onPressed: () {
                //       Navigator.pushNamed(context, 'buyScreen');
                //     },
                //     color: const Color(0xff5ED5A8),
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(16)),
                //     child: const Text(
                //       "Sign In",
                //       style: TextStyle(
                //           fontWeight: FontWeight.w400,
                //           fontSize: 16,
                //           color: Colors.black),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  String? email = '';
  String? password = '';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Email",
                style: TextStyle(
                  color: Color(0xffA7AFB7),
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                validator: (value) {
                  if (emailController.text=='') {
                    return 'Email cannot be empty';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value;
                },
                cursorColor: const Color(0xff5ED5A8),
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  hintStyle: const TextStyle(color: Color(0xff777777)),
                  fillColor: const Color(0xff161C22),
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xff5ED5A8), width: 2.0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Password",
                style: TextStyle(
                  color: Color(0xffA7AFB7),
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                autofocus: false,
                controller: passwordController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                validator: (value) {
                  if (passwordController.text == '') {
                    return 'Password cannot be empty';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value;
                },
                cursorColor: const Color(0xff5ED5A8),
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  hintStyle: const TextStyle(color: Color(0xff777777)),
                  fillColor: const Color(0xff161C22),
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xff5ED5A8), width: 2.0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Center(
            child: MaterialButton(
              minWidth: 300,
              height: 60,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  logger.i([email, password]);
                  verifyUser(context, email, password);
                }
              },
              color: const Color(0xff5ED5A8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: const Text(
                "Sign In",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

verifyUser(context, email, password) async {
  final http.Response response = await http.post(
    Uri.parse(url + "/user/verify"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password
    }),
  );
  if (response.statusCode == 200) {
    logger.i(response.body);
    Map<String, dynamic> res = jsonDecode(response.body);
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_id', res['user_id']);
    logger.i(res['user_id']);
    Navigator.of(context).pushReplacementNamed('buyScreen');
  } else {
    logger.e('Failed to login.');
    final snackBar = SnackBar(
      content: const Text('Enter the correct credentials.'),
      backgroundColor: Colors.red[500],
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

