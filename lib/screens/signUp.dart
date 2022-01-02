import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import '../assets/constants.dart' as constants;

var logger = Logger();
const String url = constants.serverUrl;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('signInScreen');
                          },
                          color: const Color(0xff161C22),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xff777777)),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 179,
                          height: 38,
                          onPressed: () {},
                          color: const Color(0xff1B232A),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffC1C7CD)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 17, top: 35),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: SignUpForm(),
                  //   child: Column(
                  //     children: [
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const Text(
                  //             "Username",
                  //             style: TextStyle(
                  //               color: Color(0xffA7AFB7),
                  //               fontSize: 16,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 20,
                  //           ),
                  //           TextField(
                  //             style: const TextStyle(
                  //               color: Colors.white,
                  //             ),
                  //             onChanged: (value) {},
                  //             cursorColor: const Color(0xff5ED5A8),
                  //             decoration: InputDecoration(
                  //               hintText: 'Enter Your Username',
                  //               hintStyle:
                  //                   const TextStyle(color: Color(0xff777777)),
                  //               fillColor: const Color(0xff161C22),
                  //               filled: true,
                  //               contentPadding: const EdgeInsets.symmetric(
                  //                   vertical: 0, horizontal: 10),
                  //               focusedBorder: UnderlineInputBorder(
                  //                 borderSide: const BorderSide(
                  //                     color: Color(0xff5ED5A8), width: 2.0),
                  //                 borderRadius: BorderRadius.circular(12.0),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       const SizedBox(
                  //         height: 30,
                  //       ),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const Text(
                  //             "Email",
                  //             style: TextStyle(
                  //               color: Color(0xffA7AFB7),
                  //               fontSize: 16,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 20,
                  //           ),
                  //           TextField(
                  //             style: const TextStyle(
                  //               color: Colors.white,
                  //             ),
                  //             onChanged: (value) {},
                  //             cursorColor: const Color(0xff5ED5A8),
                  //             decoration: InputDecoration(
                  //               hintText: 'Enter Your Email',
                  //               hintStyle:
                  //                   const TextStyle(color: Color(0xff777777)),
                  //               fillColor: const Color(0xff161C22),
                  //               filled: true,
                  //               contentPadding: const EdgeInsets.symmetric(
                  //                   vertical: 0, horizontal: 10),
                  //               focusedBorder: UnderlineInputBorder(
                  //                 borderSide: const BorderSide(
                  //                     color: Color(0xff5ED5A8), width: 2.0),
                  //                 borderRadius: BorderRadius.circular(12.0),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       const SizedBox(
                  //         height: 30,
                  //       ),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const Text(
                  //             "Password",
                  //             style: TextStyle(
                  //               color: Color(0xffA7AFB7),
                  //               fontSize: 16,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 20,
                  //           ),
                  //           TextField(
                  //             style: const TextStyle(
                  //               color: Colors.white,
                  //             ),
                  //             onChanged: (value) {},
                  //             cursorColor: const Color(0xff5ED5A8),
                  //             decoration: InputDecoration(
                  //               hintText: 'Enter Your Password',
                  //               hintStyle:
                  //                   const TextStyle(color: Color(0xff777777)),
                  //               fillColor: const Color(0xff161C22),
                  //               filled: true,
                  //               contentPadding: const EdgeInsets.symmetric(
                  //                   vertical: 0, horizontal: 10),
                  //               focusedBorder: UnderlineInputBorder(
                  //                 borderSide: const BorderSide(
                  //                     color: Color(0xff5ED5A8), width: 2.0),
                  //                 borderRadius: BorderRadius.circular(12.0),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 50,
                  // ),
                  // Center(
                  //   child: MaterialButton(
                  //     minWidth: 300,
                  //     height: 60,
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, 'signInScreen');
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  String? username = '';
  String? email = '';
  String? password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Username",
                style: TextStyle(
                  color: Color(0xffA7AFB7),
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username cannot be empty';
                  }
                  return null;
                },
                onSaved: (value) {
                  username = value;
                },
                cursorColor: const Color(0xff5ED5A8),
                decoration: InputDecoration(
                  hintText: 'Enter Your Username',
                  helperText: ' ',
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
            height: 8,
          ),
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
                style: const TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
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
                  helperText: ' ',
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
            height: 8,
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
                style: const TextStyle(
                  color: Colors.white,
                ),
                obscureText: true,
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
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
                  helperText: ' ',
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
            height: 30,
          ),
          Center(
            child: MaterialButton(
              minWidth: 300,
              height: 60,
              onPressed: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  logger.i([username,email,password]);
                  createUser(username, email, password);
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

createUser(username, email, password) async {
  final http.Response response = await http.post(
    Uri.parse(url + "/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'email' : email,
      'password': password
    }),
  );
  if (response.statusCode == 200) {
    logger.i(response.body);
  } else {
    logger.e('Failed to create album.');
  }
}
