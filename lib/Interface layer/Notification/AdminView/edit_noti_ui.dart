import 'package:cems/BLoC%20layer/Notification/AdminBloc/edit_noti_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AEditNoti extends StatefulWidget {
  const AEditNoti({Key? key}) : super(key: key);

  @override
  State<AEditNoti> createState() => _AEditNotiState();
}

class _AEditNotiState extends State<AEditNoti> {
  EditNotiBloc editNotiBloc = EditNotiBloc();

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
            child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 340,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Notification ID:'),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          onChanged: (value) => notification_id = value,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'ID',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 340,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Title:'),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          onChanged: (value) => notification_title = value,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Title',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 340,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Description:'),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          onChanged: (value) =>
                              notification_description = value,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Description',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 340,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Details:'),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          onChanged: (value) => notification_details = value,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Details',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  minimumSize: const Size.fromHeight(40),
                ),
                onPressed: () {
                  // EditNotiBloc.editNoti(
                  //   "1",
                  //   notification_id,
                  //   notification_title,
                  //   notification_description,
                  //   notification_details,
                  // );
                },
                child: const Text(
                  'Publish',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
