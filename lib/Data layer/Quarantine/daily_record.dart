class DailyRec {
  final String dailyId;
  final String userId;
  final List<bool> symptomsList;
  final bool emergencyCall;
  final String userName;
  final DateTime dateTime;
  DailyRec(
    this.dailyId,
    this.userId,
    this.symptomsList,
    this.emergencyCall,
    this.userName,
    this.dateTime,
  );

  Map<String, dynamic> toJson() => {
        'dailyId': dailyId,
        'userId': userId,
        'symptomsList': symptomsList,
        'emergencyCall': emergencyCall,
        'userName': userName,
        'dateTime': dateTime,
      };
}
