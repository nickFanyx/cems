import 'package:cems/BLoC%20layer/Notification/AdminBloc/notification_dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cems/Interface layer/Notification/AdminView/view_dashboard_ui.dart';
import 'package:cems/Interface layer/Notification/AdminView/add_noti_ui.dart';

class ANotiDashboard extends StatefulWidget {
  const ANotiDashboard({Key? key}) : super(key: key);

  @override
  State<ANotiDashboard> createState() => _ANotiDashboardState();
}

class _ANotiDashboardState extends State<ANotiDashboard> {
  ANotiDashboardBloc notiDashboardBloc = ANotiDashboardBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Notification Dashboard',
            style: TextStyle(
              fontSize: 17,
              height: 2.5,
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: notiDashboardBloc.getData(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return listitem(data);
                  }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AAddNoti(),
                  ),
                );
              },
              child: const Text('Add Notification'),
            ),
          ),
        ],
      ),
    );
  }

  Widget listitem(data) {
    return Card(
      color: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          child: SizedBox(
            width: 300,
            height: 70,
            child: Column(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  data['notification_title'],
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  data['notification_description'],
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AViewDashboard(
                    notiModel: notiDashboardBloc.creatingModel(data)),
              ),
            );
          },
        ),
      ),
    );
  }
}
