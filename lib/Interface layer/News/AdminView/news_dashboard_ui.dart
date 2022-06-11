import 'package:cems/BLoC%20layer/News/AdminBloc/news_dashboard_bloc.dart';
import 'package:cems/Interface%20layer/News/AdminView/view_news_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cems/Interface layer/News/AdminView/add_news_ui.dart';

class ANewsDashboard extends StatefulWidget {
  const ANewsDashboard({Key? key}) : super(key: key);

  @override
  State<ANewsDashboard> createState() => _ANewsDashboardState();
}

class _ANewsDashboardState extends State<ANewsDashboard> {
  ANewsDashboardBloc aNewsDashboardBloc = ANewsDashboardBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'News Dashboard',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 2.5,
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: aNewsDashboardBloc.getData(),
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
                    builder: (context) => const AAddNews(),
                  ),
                );
              },
              child: const Text('Add News'),
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
                  data['news_title'],
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  data['news_description'],
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
                builder: (context) => AViewNewsDashboard(
                    newsModel: aNewsDashboardBloc.creatingModel(data)),
              ),
            );
          },
        ),
      ),
    );
  }
}
