//importing packages
import 'package:cems/BLoC%20layer/Notification/UserBloc/home_noti_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cems/Interface layer/Notification/UserView/view_noti_ui.dart';

//using Stateful widget
class UHomeNoti extends StatefulWidget {
  const UHomeNoti({Key? key}) : super(key: key);

  @override
  State<UHomeNoti> createState() => _UHomeNoti();
}

class _UHomeNoti extends State<UHomeNoti> {
  //connecting bloc
  UHomeBloc homeBloc = UHomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: Column(
        children: [

          Expanded(
            //getdata / fetch data from db
            child: StreamBuilder<QuerySnapshot>(
              stream: homeBloc.getData(),
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
          )
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
                builder: (context) =>
                    UViewNoti(notiModel: homeBloc.creatingModel(data)),
              ),
            );
          },
        ),
      ),
    );
  }
}
