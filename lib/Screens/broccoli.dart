import 'package:dropshippingapp/components/constants.dart';
import 'package:dropshippingapp/components/reusable_card.dart';
import 'package:dropshippingapp/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../brain.dart';
import 'homescreen.dart';


class BroccoliScreen extends StatefulWidget {
  const BroccoliScreen({Key key}) : super(key: key);

  @override
  _BroccoliScreenState createState() => _BroccoliScreenState();
}

class _BroccoliScreenState extends State<BroccoliScreen> {
  functionality obj = functionality();
  var cartData = List();
  double broccoliPrice = 0;
  double quantity = 50;
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(),
          child: Text(
            'Order',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 15.0,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 30.0,
                              ),
                              child: Text(
                                'Broccoli',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.stretch, // add this
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                child: Image.asset('images/Broccoli.jpeg',
                                    width: 300, height: 200, fit: BoxFit.fill),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(),
                              child: Text(
                                'Choose Quantity',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            ReusableCard(
                              cardChild: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        quantity.toString(),
                                        style: kNumberTextStyle,
                                      ),
                                      const Text(
                                        "kg",
                                        style: kNumberTextStyle,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RoundIconButton(
                                          icon: FontAwesomeIcons.minus,
                                          onPressed: () {
                                            setState(() {
                                              if (quantity <= 500 && quantity > 0 ) {
                                                quantity = quantity - 0.25;
                                              } else if (quantity == 0) {
                                                quantity = 0;
                                              }

                                            });
                                            broccoliPrice = quantity * 12.5;
                                          }),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        onPressed: () {
                                          setState(() {
                                            if (quantity == 500) {
                                              quantity = 500;
                                            } else if (quantity >= 0 && quantity < 500 ) {
                                              quantity = quantity + 0.25;
                                            }
                                          });
                                          broccoliPrice = quantity * 12.5;
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              colour: null,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Text(
                            '$broccoliPrice Rs',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          FlatButton(
                            textColor: Colors.white,
                            color: const Color(0xff69A03A),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onPressed: () {
                              cartData.add("broccoli");
                              cartData.add(quantity);
                              cartData.add(broccoliPrice);
                              obj.cartItem(cartData);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
