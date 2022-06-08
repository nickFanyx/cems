import 'package:cems/BLoC%20layer/Quarantine/UserBloc/manage_quar_rec_bloc.dart';
import 'package:cems/Interface%20layer/Quarantine/UserView/add_daily_stat_ui.dart';
import 'package:cems/Interface%20layer/Quarantine/UserView/add_quar_record_ui.dart';
import 'package:cems/Interface%20layer/Quarantine/UserView/view_quar_rec_ui.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class UManageQuarRec extends StatefulWidget {
  const UManageQuarRec({Key? key}) : super(key: key);

  @override
  State<UManageQuarRec> createState() => _UManageQuarRecState();
}

class _UManageQuarRecState extends State<UManageQuarRec> {
  ManageQRRecordBloc manageBloc = ManageQRRecordBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UAddQuarRec(),
                  ),
                );
              },
              child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    width: 300,
                    height: 90,
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          image: AssetImage('assets/images/addquar.png'),
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add Quarantine Record',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UAddDailyStat(),
                  ),
                ),
              },
              child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    width: 300,
                    height: 90,
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          image: AssetImage('assets/images/cov.png'),
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Covid-19 Daily Record',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Quarantine Record List',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 400,
              color: Colors.white,
              child: StreamBuilder<QuerySnapshot>(
                stream: manageBloc.getData(),
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
          ),
        ],
      ),
    );
  }

  Widget listitem(data) {
    return Card(
      color: Colors.redAccent,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UViewQuarRec(
                qrModel: manageBloc.creatingModel(data),
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
              const Image(
                image: AssetImage('assets/images/addquar.png'),
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['usertype'],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
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
                      color: Colors.white,
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
