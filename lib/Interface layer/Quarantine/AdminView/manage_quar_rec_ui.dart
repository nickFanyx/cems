import 'package:cems/BLoC%20layer/Quarantine/AdminBloc/manage_quar_rec_bloc.dart';
import 'package:cems/Interface%20layer/Quarantine/AdminView/view_quar_rec_ui.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ManageQuarRec extends StatefulWidget {
  const ManageQuarRec({Key? key}) : super(key: key);

  @override
  State<ManageQuarRec> createState() => _ManageQuarRecState();
}

class _ManageQuarRecState extends State<ManageQuarRec> {
  AManageQRBloc manageQRBloc = AManageQRBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Quarantine Record List',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 580,
              color: Colors.white,
              child: StreamBuilder<QuerySnapshot>(
                stream: manageQRBloc.getData(),
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
      bottomSheet: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.redAccent,
          minimumSize: const Size.fromHeight(40),
        ),
        onPressed: () {},
        child: const Text('View Daily Status'),
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
              builder: (context) => AViewRecUI(
                qrModel: manageQRBloc.creatingModel(data),
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
                    height: 5,
                  ),
                  Container(
                    color: Colors.white,
                    height: 15,
                    child: Text(
                      data['verifyResult'],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
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
