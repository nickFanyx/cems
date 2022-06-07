class QuarantineModel {
  String recordid;
  final String userId;
  final String usertype;
  final String symptomsDetail;
  final String patientName;
  final String patientNo;
  final String quarantinePlace;
  final String quarantineAddress;
  final String testResult;
  final String verifyResult;
  final String username;
  final String staffResponse;
  final DateTime dateTime;

  QuarantineModel({
    this.recordid = '',
    required this.userId,
    required this.usertype,
    required this.symptomsDetail,
    required this.patientName,
    required this.patientNo,
    required this.quarantinePlace,
    required this.quarantineAddress,
    required this.testResult,
    required this.verifyResult,
    required this.username,
    required this.staffResponse,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() => {
        'recordid': recordid,
        'userId': userId,
        'usertype': usertype,
        'symptomsDetail': symptomsDetail,
        'patientName': patientName,
        'patientNo': patientNo,
        'quarantinePlace': quarantinePlace,
        'quarantineAddress': quarantineAddress,
        'testResult': testResult,
        'verifyResult': verifyResult,
        'username': username,
        'staffResponse': staffResponse,
        'dateTime': dateTime,
      };
}
