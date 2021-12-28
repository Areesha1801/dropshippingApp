import 'package:dropshippingapp/Screens/address.dart';
import 'package:dropshippingapp/Screens/homescreen.dart';
import 'package:dropshippingapp/bottom_icons_pages/profile.dart';
import 'package:dropshippingapp/bottom_icons_pages/shopping_cart.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff69A03A),
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'History',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
          if (_currentIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (_currentIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ShoppingCartScreen()),
            );
          } else if (_currentIndex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HistoryScreen()),
            );
          } else if (_currentIndex == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: 'History',
            icon: Icon(Icons.history),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.account_box),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Orders',
                              style: TextStyle(
                                color: Color(0xff1C6E16),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      StreamBuilder (
                        stream: FirebaseDatabase.instance
                            .reference()
                            .child('AcceptedOrders').onChildAdded,
                        builder:
                            (BuildContext context, AsyncSnapshot event) {
                          if (!event.hasData)
                            return  Center(child: Text('No History available'),); //CircularProgressIndicator();
                          Map<dynamic, dynamic> data = event.data.snapshot.value;
                          return Example(data);

                        },
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
  Widget PostsUI(String TotalPrice, String Item, String Location, String Name,String  Number,String PaymentMethod, String image, String time){
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),

      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),

            ),

            SizedBox(height: 10.0,),
            Row(children: [
              const Text(
                "Time : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "$time",
                style: Theme.of(context).textTheme.subtitle1,

              ),
            ],),
            Row(children: [
              const Text(
                "Payment Method : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                " $PaymentMethod",
                style: Theme.of(context).textTheme.subtitle1,

              ),
            ],),
            Row(children: [
              const Text(
                "Total Price : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                " $TotalPrice Rs",
                style: Theme.of(context).textTheme.subtitle1,

              ),
            ],),

            SizedBox(height: 10.0,),
            Center( child: new Image.network(image, fit:BoxFit.cover, height: 150,),),

            SizedBox(height: 10.0,),
            const Text(
              "Cart :",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
                "$Item",
                style: Theme.of(context).textTheme.headline6

            ),
            const Text(
              "Address :",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              "$Location",
              style: Theme.of(context).textTheme.subtitle1,

            ),
            Row(children: [
              const Text(
                "Name : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "$Name",
                style: Theme.of(context).textTheme.subtitle1,

              ),
            ],),
            Row(children: [
              const Text(
                "Contact Number : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "$Number",
                style: Theme.of(context).textTheme.subtitle1,

              ),
            ],),

            SizedBox(height: 20.0,),

          ],
        ),

      ),
    );
  }
  Widget PostsUINoImage(String TotalPrice, String Item, String Location, String Name,String  Number,String PaymentMethod, String time){
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),

      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),

            ),

            Row(children: [
              const Text(
                "Time : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "$time",
                style: Theme.of(context).textTheme.subtitle1,

              ),
            ],),
            Row(children: [
              const Text(
                "Payment Method : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                " $PaymentMethod",
                style: Theme.of(context).textTheme.subtitle1,

              ),
            ],),
            Row(children: [
              const Text(
                "Total Price : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                " $TotalPrice Rs",
                style: Theme.of(context).textTheme.subtitle1,

              ),
            ],),

            SizedBox(height: 10.0,),

            const Text(
              "Cart :",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              "$Item",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,

            ),
            const Text(
              "Address :",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              "$Location",
              style: Theme.of(context).textTheme.subtitle1,

            ),
            Row(children: [
              const Text(
                "Name : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "$Name",
                style: Theme.of(context).textTheme.subtitle1,

              ),
            ],),
            Row(children: [
              const Text(
                "Contact Number : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "$Number",
                style: Theme.of(context).textTheme.subtitle1,

              ),
            ],),

            SizedBox(height: 20.0,),
          ],
        ),

      ),
    );
  }
  String Item;
  String Location;
  String Name;
  String  Number;
  String PaymentMethod;
  String image;
  String time;
  String TotalPrice;
  Widget Example(data) {

    for(var i in data.keys){
      if(i == 'Item'){
        Item = data['$i'];
      }else if(i == 'Location'){
        Location = data['$i'];
      }else if(i == 'Name'){
        Name = data['$i'];
      }else if(i == 'Number'){
        Number = data['$i'];
      }else if(i == 'PaymentMethod'){
        PaymentMethod = data['$i'];
      }else if(i == 'image'){
        image = data['$i'];
      }else if(i == 'time'){
        time = data['$i'];
      }else if(i == 'TotalPrice'){
        TotalPrice = data['$i'].toString();
      }
      // items = data['$i'];
    }
    if(image == null){
      return PostsUINoImage(TotalPrice, Item, Location, Name, Number, PaymentMethod, time);
    }else{
      return PostsUI(TotalPrice, Item, Location, Name, Number, PaymentMethod, image, time);
    }

  }
}
