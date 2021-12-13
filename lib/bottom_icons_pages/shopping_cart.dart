import 'package:dropshippingapp/Screens/address.dart';
import 'package:dropshippingapp/Screens/homescreen.dart';
import 'package:dropshippingapp/bottom_icons_pages/profile.dart';
import 'package:dropshippingapp/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../brain.dart';
import 'history.dart';



class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key key}) : super(key: key);

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  functionality obj = functionality();
  double totalBill = 0.0;
  var cartData = List();
  var cartDataWidgets = List<Widget>();
  int _currentIndex = 0;
  @override
  void initState() {
    for (int i=0; i<=obj.showItems().length-1; ) {
        print("${obj.showItems()[i]}");
        cartData.add(obj.showItems()[i]);
      i++;
    }

    for (int i=0; i<=cartData.length-1; ) {
      for (int j=0; j<=1; j++) {
        totalBill = totalBill + cartData[i+2];
      cartDataWidgets.add(Text("${cartData[i]} ,        ${cartData[i+1]} kg ,        ${cartData[i+2]} Rs" , style: TextStyle(fontSize: 20),)); // TODO: Whatever layout you need for each widget.
      cartDataWidgets.add(const SizedBox(width: 10,)); // TODO: Whatever layout you need for each widget.
        if(i == 0)
          {i = i + 3;}
        else{i = i + 3;}

      }

      cartDataWidgets.add(const SizedBox(height: 10,));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xff69A03A),
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Cart',
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10),
        child: ListView(children: [
        SizedBox(height: 60,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text("Items", style: TextStyle(fontSize: 28),),
          Text("Quantity", style: TextStyle(fontSize: 28),),
          Text("Price", style: TextStyle(fontSize: 28),),
        ],),
        SizedBox(height: 30,),
        Center(child: Column(children: cartDataWidgets,),
        ),
          SizedBox(
            height: 30,
            child: Divider(
              color: Colors.black,
              thickness: 1.0,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
            child:Text("Total Bill : $totalBill Rs", style: TextStyle(fontSize: 22), textAlign: TextAlign.right,),),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                textColor: Colors.white,
                color: const Color(0xff69A03A),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Empty Cart",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                },
              ),
              FlatButton(
            textColor: Colors.white,
            color: const Color(0xff69A03A),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Proceed",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () {
              obj.getBill(totalBill);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddressScreen()),
              );
            },
          ),

            ],
          ),
      ],
      ),
      ),
    );
  }
}
