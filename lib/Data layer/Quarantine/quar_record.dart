class QuarantineModel {
  final String recordid;
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

  QuarantineModel(
    this.recordid,
    this.userId,
    this.usertype,
    this.symptomsDetail,
    this.patientName,
    this.patientNo,
    this.quarantinePlace,
    this.quarantineAddress,
    this.testResult,
    this.verifyResult,
    this.username,
    this.staffResponse,
    this.dateTime,
  );

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
