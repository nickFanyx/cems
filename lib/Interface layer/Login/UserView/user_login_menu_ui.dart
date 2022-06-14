import 'package:cems/BLoC%20layer/Login/UserBloc/user_login_menu_bloc.dart';
import 'package:cems/Interface%20layer/Login/AdminView/admin_login_menu_ui.dart';
import 'package:cems/Interface%20layer/Registration/UserView/registration_menu_ui.dart';
import 'package:cems/home.dart';
import 'package:cems/theme.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class User_Login extends StatefulWidget {
  const User_Login({Key? key}) : super(key: key);

  @override
  State<User_Login> createState() => _User_Login();
 
}

class _User_Login extends State<User_Login> {
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
          'Log in',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            
          ),
         ), 
        
          SizedBox(height: 15),

        //Citizen type
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
                  hintText: 'Citizen type'
                ),
              ),
            ),
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
                  hintText: 'Email Address'
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

        TextButton(
          style: TextButton.styleFrom(
          primary: Colors.blue,
        ),
        onPressed: () { 
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Registration())
              );
        },
        child: Text('Create new Account?'),
        ),

        SizedBox(height: 9),

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
              MaterialPageRoute(builder: (context) => Home())
              );
            },
            child: Text(
              'Login'
              ),
            ),
          ),
        ),

        SizedBox(height: 15),

        //Login Button for admin
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
              MaterialPageRoute(builder: (context) => Admin_Login())
              );
            },
            child: Text(
              'Login for Admin'
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
  
  



  

  