import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../brain.dart';
import 'address.dart';
import 'success.dart';

class JazzCash extends StatefulWidget {
  const JazzCash({Key key}) : super(key: key);

  @override
  _JazzCashState createState() => _JazzCashState();
}

class _JazzCashState extends State<JazzCash> {
  functionality obj = functionality();
  String x;
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
              'Jazz Cash',
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
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Your Total Bill is ${obj.bill()} Rs',

                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Please pay amount to Jazzcash Account:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        '1234567891 and upload receipt',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
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
                            "Upload Receipt",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {},
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
                            "Place Order",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Success()));
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
