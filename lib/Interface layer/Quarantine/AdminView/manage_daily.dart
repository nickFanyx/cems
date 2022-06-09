import 'package:cems/BLoC%20layer/Quarantine/AdminBloc/manage_daily_bloc.dart';
import 'package:cems/Data%20layer/Quarantine/daily_record.dart';
import 'package:cems/Interface%20layer/Quarantine/AdminView/view_daily_stat_ui.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ManageDailyStat extends StatefulWidget {
  const ManageDailyStat({Key? key}) : super(key: key);

  @override
  State<ManageDailyStat> createState() => _ManageDailyStatState();
}

class _ManageDailyStatState extends State<ManageDailyStat> {
  ManageDailybloc manageDailybloc = ManageDailybloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Status'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 400,
          color: Colors.white,
          child: StreamBuilder<QuerySnapshot>(
            stream: manageDailybloc.getData(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return listitem(data);
                }).toList(),
              );
            },
          ),
        ),
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
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewDailyStat(
                dailyModel: manageDailybloc.createModel(data),
              ),
            ),
          );
        },
        child: SizedBox(
          width: 300,
          height: 90,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              data['emergencyCall'] == true
                  ? const Icon(
                      Icons.call_rounded,
                      size: 30,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 30,
                      color: Colors.green,
                    ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['userName'],
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    DateFormat('MMMM d, yyyy – KK : mm a')
                        .format(((data['dateTime'] as Timestamp).toDate())),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
