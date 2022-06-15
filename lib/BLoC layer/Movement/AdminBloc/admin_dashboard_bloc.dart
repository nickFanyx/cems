import 'package:cems/Data%20layer/Movement/move_record.dart';
import 'package:cems/Interface%20layer/Movement/AdminView/view_mov_rec_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AMovRecBloc {
  getQuery() async {
    return FirebaseFirestore.instance
        .collection("MovementRecord")
        .orderBy("dateTime", descending: true)
        .get();
  }

  MovementModel creatingModel(var data) {
    MovementModel model = MovementModel(
      data['userId'],
      data['locationName'],
      data['movStatus'],
      data['name'],
      data['riskLevel'],
      data['vacStatus'],
      (data['dateTime'] as Timestamp).toDate(),
    );

    return model;
  }

  Widget listit(BuildContext context, DocumentSnapshot document) {
    MovementModel rec = MovementModel.fromSnapshot(document);

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
              builder: (context) => AViewMoveRecUI(
                mvModel: rec,
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
                image: AssetImage('assets/images/location.png'),
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
                    rec.name,
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
                  color: Colors.pink,
                  height: 15,
                  child: Text(
                    rec.movStatus,
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
