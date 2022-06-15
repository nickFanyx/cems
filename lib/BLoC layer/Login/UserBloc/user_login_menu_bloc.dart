import 'package:cems/Data%20layer/Login/user_login_menu_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginRecord {
  Future Login(String userType, String email,
      String password) async {
    final docRec = FirebaseFirestore.instance.collection("LoginRecord").doc();
    final LoginRecord stat = LoginRecord(
      docRec.id,
      userType,
      email,
      password,
    );
      
    final json = stat.toJson();
    await docRec.set(json);
  }
}