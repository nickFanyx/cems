import 'package:cems/Interface%20layer/News/UserView/news_home_ui.dart';
import 'package:cems/Interface%20layer/Quarantine/UserView/manage_quar_rec_ui.dart';
import 'package:cems/Interface%20layer/Movement/UserView/checkin_dashboard_ui.dart';
import 'package:cems/Interface%20layer/Vaccination/UserView/vacc_status_ui.dart';
import 'package:flutter/material.dart';
import 'Interface layer/Notification/UserView/home_noti_ui.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _list = [
    UNewsHome(),
    UCheckInRec(),
    UManageQuarRec(),
    UManageQuarRec(),
    CheckStatus(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEMS'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: Center(
        child: _list.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Check-in',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Dependent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work),
            label: 'Quarantine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vaccines),
            label: 'Vaccine',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
