import 'package:flutter/material.dart';

Future<void> showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(
          child: Text(
            'Transaction Status',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xff1B232A),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.check,
                color: Color(0xff5ED5A8),
                size: 40,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Successful',
                  style: TextStyle(
                    color: Color(0xff5ED5A8),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff5ED5A8),
              ),
            ),
            onPressed: () {
              Navigator.popUntil(
                  context, ModalRoute.withName('mainScreen'));
            },
          ),
        ],
      );
    },
  );
}