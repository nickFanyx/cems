import 'package:cems/Data%20layer/Quarantine/quar_record.dart';
import 'package:cems/Interface%20layer/Quarantine/AdminView/view_quar_rec_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AManageQRBloc {
  getQuery() async {
    return FirebaseFirestore.instance
        .collection("QuarantineRecord")
        .orderBy("dateTime", descending: true)
        .get();
  }

  QuarantineModel creatingModel(var data) {
    QuarantineModel model = QuarantineModel(
      data['recordid'],
      data['userId'],
      data['usertype'],
      data['symptomsDetail'],
      data['patientName'],
      data['patientNo'],
      data['quarantinePlace'],
      data['quarantineAddress'],
      data['testResult'],
      data['verifyResult'],
      data['username'],
      data['staffResponse'],
      (data['dateTime'] as Timestamp).toDate(),
    );

    return model;
  }

  Widget listit(BuildContext context, DocumentSnapshot document) {
    QuarantineModel rec = QuarantineModel.fromSnapshot(document);

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
              builder: (context) => AViewRecUI(
                qrModel: rec,
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
                    rec.usertype,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    DateFormat('MMMM d, yyyy – KK : mm a')
                        .format(((rec.dateTime))),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.red,
                  height: 15,
                  child: Text(
                    rec.verifyResult,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
