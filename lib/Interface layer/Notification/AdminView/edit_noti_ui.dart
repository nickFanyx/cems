//importing packages
import 'package:cems/BLoC%20layer/Notification/AdminBloc/edit_noti_bloc.dart';
import 'package:cems/Data%20layer/Notification/notification_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AEditNoti extends StatefulWidget {
  final NotificationModel notiModel;
  const AEditNoti({Key? key, required this.notiModel}) : super(key: key);

  @override
  State<AEditNoti> createState() => _AEditNotiState();
}

//connecting to bloc
class _AEditNotiState extends State<AEditNoti> {
  EditNotiBloc editNotiBloc = EditNotiBloc();

//assign value based on the past data
  @override
  Widget build(BuildContext context) {
    String notification_id = widget.notiModel.notification_id;
    String notification_title = widget.notiModel.notification_title;
    String notification_description = widget.notiModel.notification_description;
    String notification_details = widget.notiModel.notification_details;
    return Scaffold(
      appBar: AppBar(
        //title page
        title: const Text('Update Notification'),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            //Card
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
                        //text field label
                        const Text('Title:'),
                        //sizedbox
                        const SizedBox(
                          height: 15,
                        ),
                        //input field 1 textfield
                        TextField(
                          controller: TextEditingController(
                              text: widget.notiModel.notification_title),
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
                        //text field label
                        const Text('Description:'),
                        const SizedBox(
                          height: 15,
                        ),
                        //input field 2 text field
                        TextField(
                          controller: TextEditingController(
                              text: widget.notiModel.notification_description),
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
                        //label text field
                        const Text('Details:'),
                        const SizedBox(
                          height: 15,
                        ),
                        //input field text field
                        TextField(
                          controller: TextEditingController(
                              text: widget.notiModel.notification_details),
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
                //button update
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  minimumSize: const Size.fromHeight(40),
                ),
                onPressed: () {
                  editNotiBloc.updateRec(notification_id, notification_title,
                      notification_description, notification_details);
                },
                child: const Text(
                  'Update',
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
