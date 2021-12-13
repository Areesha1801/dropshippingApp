import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../brain.dart';
import 'address.dart';
import 'jazz_cash.dart';
import 'success.dart';

class paymentOption extends StatefulWidget {
  const paymentOption({Key key}) : super(key: key);

  @override
  _paymentOptionState createState() => _paymentOptionState();
}

class _paymentOptionState extends State<paymentOption> {
  functionality obj = functionality();
  String payMethod = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xff69A03A),
        leading: Padding(
          padding: const EdgeInsets.only(),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddressScreen()));
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(),
          child: Center(
            child: Text(
              'Payment Option',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 20,
                      ),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: const Color(0xff69A03A),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Cash on Delivery",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          payMethod = "COD";
                          obj.paymentMethod(payMethod);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Success()));


                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 20,
                      ),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: const Color(0xff69A03A),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "JazzCash",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          payMethod = "Jazzcash";
                          obj.paymentMethod(payMethod);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const JazzCash()));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
