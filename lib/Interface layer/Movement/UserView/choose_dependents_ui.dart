import 'package:flutter/material.dart';
import 'user_dashboard_ui.dart';

class UChooseDep extends StatefulWidget {
  const UChooseDep({Key? key}) : super(key: key);

  @override
  State<UChooseDep> createState() => _UChooseDepState();
}

class _UChooseDepState extends State<UChooseDep> {
  final allowNotifications = NotificationSetting(title: 'Select All');

  final notifications = [
    NotificationSetting(title: 'Dependent One'),
    NotificationSetting(title: 'Dependent Two'),
    NotificationSetting(title: 'Dependent Three'),
  ];
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
            height: 350,
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
