import 'package:cems/BLoC%20layer/Login/AdminBloc/admin_login_menu_bloc.dart';
import 'package:cems/home.dart';
import 'package:cems/home_admin.dart';
import 'package:cems/theme.dart';
import 'package:flutter/material.dart';

class Admin_Login extends StatefulWidget {
  const Admin_Login({Key? key}) : super(key: key);

  @override
  State<Admin_Login> createState() => _Admin_Login();
 
}

class _Admin_Login extends State<Admin_Login> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:SafeArea(
        child: Center(
          child: Column(
          children: [
         
         Image(
          image: AssetImage('assets/images/cemsicon.png'),
          width: 250,
          height: 250,
          ),

         //Log In
         SizedBox(height: 50),
         Text(
          'Login for Admin',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            
          ),
         ), 

        SizedBox(height: 15),

        //Email
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12)

            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Admin ID'
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 15),

        //password
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password'
                ),
              ),
            ),
          ),
        ),
        
        //forgot password
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Password?',

              style: TextStyle(
                color: Colors.blue,
                
              ),
              
              ),
          ],
        ),
        SizedBox(height: 15),

        //Login Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          child: Container(
            width: 1000,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(12)
              ),
            child: TextButton(
            style: TextButton.styleFrom(
            primary: Colors.white,
            ),
            onPressed: () { 
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeAdmin())
              );
            },
            child: Text(
              'Login'
              ),
            ),
          ),
        ),
         
        ],)
        ),
        ),
      );
    }
  }



  

  