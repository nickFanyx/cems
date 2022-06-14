import 'package:cems/Interface%20layer/News/AdminView/news_dashboard_ui.dart';
import 'package:cems/Interface%20layer/Quarantine/AdminView/admin_quar_rec_ui.dart';
import 'package:cems/header.dart';
import 'package:flutter/material.dart';
import 'Interface layer/Notification/AdminView/noti_dashboard_ui.dart';
import 'Interface layer/News/AdminView/add_news_ui.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = const ANewsDashboard();
    } else if (currentPage == DrawerSections.uservaccination) {
      container = const ManageQuarRec();
    } else if (currentPage == DrawerSections.uservaccinationregis) {
      container = const ManageQuarRec();
    } else if (currentPage == DrawerSections.vaccineverification) {
      container = const ManageQuarRec();
    } else if (currentPage == DrawerSections.profileregis) {
      container = const ManageQuarRec();
    } else if (currentPage == DrawerSections.checkincheck) {
      container = const ManageQuarRec();
    } else if (currentPage == DrawerSections.userquarrec) {
      container = const ManageQuarRec();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEMS'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ANotiDashboard(),
                ),
              );
            },
          )
        ],
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "User Vaccination", Icons.person,
              currentPage == DrawerSections.uservaccination ? true : false),
          menuItem(
              3,
              "User Vaccination Registration",
              Icons.person_add_alt_sharp,
              currentPage == DrawerSections.uservaccinationregis
                  ? true
                  : false),
          menuItem(
              4,
              "Vaccination Verification for\nMalaysia Visitor",
              Icons.assignment,
              currentPage == DrawerSections.vaccineverification ? true : false),
          menuItem(5, "Profile registration Verification", Icons.verified_user,
              currentPage == DrawerSections.profileregis ? true : false),
          menuItem(6, "Checkin/Checkout Record", Icons.insert_drive_file,
              currentPage == DrawerSections.checkincheck ? true : false),
          menuItem(7, "User Quarantine Record", Icons.groups,
              currentPage == DrawerSections.userquarrec ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.uservaccination;
            } else if (id == 3) {
              currentPage = DrawerSections.uservaccinationregis;
            } else if (id == 4) {
              currentPage = DrawerSections.vaccineverification;
            } else if (id == 5) {
              currentPage = DrawerSections.profileregis;
            } else if (id == 6) {
              currentPage = DrawerSections.checkincheck;
            } else if (id == 7) {
              currentPage = DrawerSections.userquarrec;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  uservaccination,
  uservaccinationregis,
  vaccineverification,
  profileregis,
  checkincheck,
  userquarrec,
}
