import 'package:cems/BLoC%20layer/Login/UserBloc/user_login_menu_bloc.dart';

class LoginRecord {
  final String loginId;
  final String userType;
  final String email;
  final String password;
  LoginRecord(
    this.loginId,
    this.userType,
    this.email,
    this.password,
  );

  Map<String, dynamic> toJson() => {
        'loginId': loginId,
        'userType': userType,
        'email': email,
        'password': password,
      };
}