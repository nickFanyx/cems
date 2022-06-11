import 'package:cems/BLoC%20layer/Notification/AdminBloc/add_noti_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AAddNoti extends StatefulWidget {
  const AAddNoti({Key? key}) : super(key: key);

  @override
  State<AAddNoti> createState() => _AAddNotiState();
}

class _AAddNotiState extends State<AAddNoti> {
  AddNotiBloc addNotiBloc = AddNotiBloc();

  String notification_id = "";
  String notification_title = "";
  String notification_description = "";
  String notification_details = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notification'),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Notification Title'),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (value) => notification_title = value,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Title',
                          ),
                        )
                      ]),
                )),
          ),
          Card(
            color: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Notification Description'),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (value) =>
                              notification_description = value,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Description',
                          ),
                        )
                      ]),
                )),
          ),
          Card(
            color: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Notification Details'),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (value) => notification_details = value,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Details',
                          ),
                        )
                      ]),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: () {
                addNotiBloc.addNoti("1", notification_id, notification_title,
                    notification_description, notification_details);
              },
              child: const Text(
                'Publish',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ]),
      )),
    );
  }
}
