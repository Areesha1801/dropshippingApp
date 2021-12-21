import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'address.dart';
import 'homescreen.dart';
import 'jazz_cash.dart';




class Success extends StatefulWidget {
  const Success({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SuccessState();
  }
}

class SuccessState extends State<Success> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          Center(
            child: IconButton(
              icon: Icon(Icons.check),
              color: Colors.green,
              iconSize: 80,
              onPressed: () {
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('ORDER PLACED SUCCESFULLY',
                        speed: const Duration(milliseconds: 166)),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}

