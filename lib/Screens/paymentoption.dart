import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:intl/intl.dart';
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
  String item;
  String quanity;
  String price;

  void saveToDatabase() async{
    var dbTimeKey = new DateTime.now();
    var formatDate = DateFormat('MM d, yyyy');
    var formateTime = DateFormat('EEE, hh:mm aaa');

    String date=formatDate.format(dbTimeKey);
    String time=formateTime.format(dbTimeKey);
    DatabaseReference ref = FirebaseDatabase.instance.ref();

    String potato = "${obj.showItems()[0]} : ${obj.showItems()[1]} g, ${obj.showItems()[2]} Rs";
    String brocolli = "${obj.showItems()[3]} : ${obj.showItems()[4]} g, ${obj.showItems()[5]} Rs";


    var cartData={
      "Item": "$potato , $brocolli",
      "time": time,
      "Location": obj.showLocation(),
      "PaymentMethod": "COD",
      "Name": "Areesha",//obj.userName(),
      "Number": "03081726082",//obj.userNumber(),
      "TotalPrice": obj.bill(),
    };
    ref.child("Order1").push().set(cartData);
  }
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
                          saveToDatabase();
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
