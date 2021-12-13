import 'package:dropshippingapp/Screens/address.dart';
import 'package:dropshippingapp/Screens/homescreen.dart';
import 'package:dropshippingapp/bottom_icons_pages/profile.dart';
import 'package:dropshippingapp/bottom_icons_pages/shopping_cart.dart';
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
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          // add this
                          children: <Widget>[
                            const ListTile(
                              title: Text(
                                'Order 1',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // subtitle: Text(''),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Potato"),
                                Text("100 Kg"),
                                Text("200 Rs"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Potato"),
                                Text("100 Kg"),
                                Text("200 Rs"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Potato"),
                                Text("100 Kg"),
                                Text("200 Rs"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Potato"),
                                Text("100 Kg"),
                                Text("200 Rs"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: FlatButton(
                          textColor: Colors.white,
                          color: const Color(0xff69A03A),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Re-Order",
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
                                  builder: (context) => const AddressScreen()),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          // add this
                          children: <Widget>[
                            const ListTile(
                              title: Text(
                                'Order 2',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // subtitle: Text(''),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Potato"),
                                Text("100 Kg"),
                                Text("200 Rs"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Potato"),
                                Text("100 Kg"),
                                Text("200 Rs"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Potato"),
                                Text("100 Kg"),
                                Text("200 Rs"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Potato"),
                                Text("100 Kg"),
                                Text("200 Rs"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: FlatButton(
                          textColor: Colors.white,
                          color: const Color(0xff69A03A),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Re-Order",
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
                                  builder: (context) => const AddressScreen()),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          // add this
                          children: <Widget>[
                            const ListTile(
                              title: Text(
                                'Order 3',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // subtitle: Text(''),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Potato"),
                                Text("100 Kg"),
                                Text("200 Rs"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Potato"),
                                Text("100 Kg"),
                                Text("200 Rs"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Potato"),
                                Text("100 Kg"),
                                Text("200 Rs"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Potato"),
                                Text("100 Kg"),
                                Text("200 Rs"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Padding(
                      padding: const EdgeInsets.only(
                      top: 20.0,
                      ),
                      child: FlatButton(
                      textColor: Colors.white,
                      color: const Color(0xff69A03A),
                      child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                      "Re-Order",
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
                      builder: (context) => const AddressScreen()),
                      );
                      },
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      ),
                      ),
                      ),
                        ],
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
