import 'package:cems/BLoC%20layer/Notification/AdminBloc/view_dashboard_bloc.dart';
import 'package:cems/Data%20layer/Notification/notification_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AViewDashboard extends StatefulWidget {
  final NotificationModel notiModel;
  const AViewDashboard({Key? key, required this.notiModel}) : super(key: key);

  @override
  State<AViewDashboard> createState() => _AViewDashboardState();
}

class _AViewDashboardState extends State<AViewDashboard> {
  ViewDashboardBloc viewDashboardBloc = ViewDashboardBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Details'),
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 360,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(' ${widget.notiModel.user_id}'),
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 360,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(' ${widget.notiModel.notification_id}'),
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 360,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(' ${widget.notiModel.notification_title}'),
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 360,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(' ${widget.notiModel.notification_description}'),
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 360,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 320,
                          child:
                              Text(' ${widget.notiModel.notification_details}'),
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
                  showDialog<String>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Delete?'),
                      content: const Text(
                          'Are you sure you want to delete this notification?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            viewDashboardBloc
                                .deleteNoti(widget.notiModel.notification_id);
                            Navigator.pop(context, 'YES');
                            Navigator.pop(context);
                          },
                          child: const Text('YES'),
                        )
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Delete Notification',
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
