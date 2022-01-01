import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
            size: 30,
            color: Color(0xff5ED5A8),
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/user-image.png',
                    height: 110,
                    width: 110,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    "User name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                        color: const Color(0xffC1C7CD),
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Arjun",
                      style: TextStyle(
                        color: const Color(0xff777777),
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.only(left: 2),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 24,
                        color: Color(0xff777777),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        color: const Color(0xffC1C7CD),
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "arjun@test.com",
                      style: TextStyle(
                        color: const Color(0xff777777),
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.only(left: 2),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 24,
                        color: Color(0xff777777),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                        color: const Color(0xffC1C7CD),
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Arjun123",
                      style: TextStyle(
                        color: const Color(0xff777777),
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.only(left: 2),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 24,
                        color: Color(0xff777777),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: MaterialButton(
                    minWidth: 180,
                    height: 60,
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil('welcomeScreen', (Route<dynamic> route) => false);
                    },
                    color: const Color(0xff5ED5A8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: const Text(
                      "SIGN OUT",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
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
