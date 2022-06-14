// ignore_for_file: non_constant_identifier_names

class VaccRegisterRec {
  final String vaccRegisterId;
  final String userId;
  final bool vaccInterest;
  final bool vaccDisease;
  final bool vaccOku;
  final DateTime dateTime;

  VaccRegisterRec(
    this.vaccRegisterId,
    this.userId,
    this.vaccInterest,
    this.vaccDisease,
    this.vaccOku,
    this.dateTime,
  );

  Map<String, dynamic> toJson() => {
        'vaccRegister_id': vaccRegisterId,
        'user_id': userId,
        'vacc_interest': vaccInterest,
        'vacc_disease': vaccDisease,
        'vacc_oku': vaccOku,
        'dateTime': dateTime,
      };
}
