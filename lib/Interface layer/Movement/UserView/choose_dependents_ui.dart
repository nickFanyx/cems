import 'package:cems/BLoC%20layer/Movement/UserBloc/choose_dependents_bloc.dart';
import 'package:flutter/material.dart';
import 'user_dashboard_ui.dart';

class UChooseDep extends StatefulWidget {
  const UChooseDep({Key? key}) : super(key: key);

  @override
  State<UChooseDep> createState() => _UChooseDepState();
}

class _UChooseDepState extends State<UChooseDep> {
  AddMovRecordBloc addMovRecordBloc = AddMovRecordBloc();
  final allowNotifications = NotificationSetting(title: 'Select All');

  final notifications = [
    NotificationSetting(title: 'Dependent One'),
    NotificationSetting(title: 'Dependent Two'),
    NotificationSetting(title: 'Dependent Three'),
  ];

  String currAdd = "",
      movStatus = "",
      name = "",
      riskLevel = "",
      userId = "",
      vacStatus = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Dependents'),
      ),
      body: ListView(
        children: [
          buildToggleCheckbox(allowNotifications),
          const Divider(),
          ...notifications.map(buildSingleCheckbox).toList(),
          const SizedBox(
            height: 300,
          ),
          Card(
            color: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: 340,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Enter location to check-in'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (value) => currAdd = value,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Location Name',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(200, 60),
                maximumSize: const Size(200, 70),
                backgroundColor: const Color.fromARGB(255, 255, 100, 124),
                primary: Colors.white,
              ),
              onPressed: () {
                addMovRecordBloc.addMovRecord(
                  "01110109615",
                  currAdd,
                  "Check-In",
                  "Nurin Azyyati Binti Kamilizahri",
                  "Low Risk",
                  "Fully Vaccinated",
                );
                showDialog<String>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Added!'),
                    content:
                        const Text('Movement Record Added Successfully!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UMovDashboard(),
                  ),
                );
              },
              child: const Text(
                "Confirm",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildToggleCheckbox(NotificationSetting notification) => buildCheckbox(
      notification: notification,
      onClicked: () {
        final newValue = !notification.value;

        setState(() {
          allowNotifications.value = newValue;
          for (var notification in notifications) {
            notification.value = newValue;
          }
        });
      });

  Widget buildSingleCheckbox(NotificationSetting notification) => buildCheckbox(
        notification: notification,
        onClicked: () {
          setState(() {
            final newValue = !notification.value;
            notification.value = newValue;

            if (!newValue) {
              allowNotifications.value = false;
            } else {
              final allow =
                  notifications.every((notification) => notification.value);
              allowNotifications.value = allow;
            }
          });
        },
      );

  Widget buildCheckbox({
    required NotificationSetting notification,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: notification.value,
          onChanged: (value) => onClicked(),
        ),
        title: Text(
          notification.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
}

class NotificationSetting {
  String title;
  bool value;

  NotificationSetting({
    required this.title,
    this.value = false,
  });
}
