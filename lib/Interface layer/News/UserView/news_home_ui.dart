import 'package:cems/BLoC%20layer/News/UserBloc/news_home_bloc.dart';
import 'package:cems/Interface%20layer/Notification/UserView/home_noti_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cems/Interface layer/News/UserView/view_news_ui.dart';

class UNewsHome extends StatefulWidget {
  const UNewsHome({Key? key}) : super(key: key);

  @override
  State<UNewsHome> createState() => _UNewsHomeState();
}

class _UNewsHomeState extends State<UNewsHome> {
  UNewsHomeBloc uNewsHomeBloc = UNewsHomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'News',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 2.5,
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: uNewsHomeBloc.getData(),
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
                    builder: (context) => const UHomeNoti(),
                  ),
                );
              },
              child: const Text('Go To Notification'),
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
                builder: (context) =>
                    UViewNews(newsModel: uNewsHomeBloc.creatingModel(data)),
              ),
            );
          },
        ),
      ),
    );
  }
}
