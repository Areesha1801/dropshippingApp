import 'package:dropshippingapp/adminside/profile.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key key}) : super(key: key);
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
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
              MaterialPageRoute(builder: (context) => const AdminPage()),
            );
          } else if (_currentIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HistoryPage()),
            );
          } else if (_currentIndex == 2) {
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
            label: 'History',
            icon: Icon(Icons.history),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 10.0,
                            ),
                            child: Text(
                              'Total Orders',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 60.0,
                            ),
                            child: Text(
                              '70',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 15.0,
                            ),
                            child: Text(
                              'Accepted',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 90.0,
                            ),
                            child: Text(
                              '50',
                              style: TextStyle(
                                color: Color(0xff69A03A),
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 15.0,
                            ),
                            child: Text(
                              'Rejected',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 90.0,
                            ),
                            child: Text(
                              '10',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 15.0,
                            ),
                            child: Text(
                              'Pending',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 90.0,
                            ),
                            child: Text(
                              '5',
                              style: TextStyle(
                                color: Color(0xff69A03A),
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 15.0,
                            ),
                            child: Text(
                              ' Order 1',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 90.0,
                            ),
                            child: Text(
                              'Accepted',
                              style: TextStyle(
                                color: Color(0xff69A03A),
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 15.0,
                            ),
                            child: Text(
                              ' Order 2',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 90.0,
                            ),
                            child: Text(
                              'Accepted',
                              style: TextStyle(
                                color: Color(0xff69A03A),
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 15.0,
                            ),
                            child: Text(
                              ' Order 3',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 90.0,
                            ),
                            child: Text(
                              'Rejected',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 15.0,
                            ),
                            child: Text(
                              ' Order 4',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 90.0,
                            ),
                            child: Text(
                              'Rejected',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 15.0,
                            ),
                            child: Text(
                              ' Order 5',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 90.0,
                            ),
                            child: Text(
                              'Rejected',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 25.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
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
