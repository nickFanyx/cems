import 'package:cloud_firestore/cloud_firestore.dart';

class MovementModel {
  // final String recordid;
  final String userId;
  final String locationName;
  final String movStatus;
  final String name;
  final String riskLevel;
  final String vacStatus;
  final DateTime dateTime;

  MovementModel(
    this.userId,
    this.locationName,
    this.movStatus,
    this.name,
    this.riskLevel,
    this.vacStatus,
    this.dateTime,
  );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'locationName': locationName,
        'movStatus': movStatus,
        'name': name,
        'riskLevel': riskLevel,
        'vacStatus': vacStatus,
        'dateTime': dateTime,
      };

  MovementModel.fromSnapshot(DocumentSnapshot snapshot)
      : userId = snapshot['userId'],
        locationName = snapshot['locationName'],
        movStatus = snapshot['movStatus'],
        name = snapshot['name'],
        riskLevel = snapshot['riskLevel'],
        vacStatus = snapshot['vacStatus'],
        dateTime = (snapshot['dateTime'] as Timestamp).toDate();
}
