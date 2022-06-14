import 'package:cems/BLoC%20layer/Registration/UserBloc/registration_bloc.dart';
import 'package:cems/Interface%20layer/Login/UserView/user_login_menu_ui.dart';
import 'package:cems/Interface%20layer/Registration/UserView/registration_menu_ui.dart';
import 'package:cems/theme.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _Registration();
 
}

class _Registration extends State<Registration> {
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
          'Registration',
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

        SizedBox(height: 30),

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
        SizedBox(height: 15),
        //confirm password
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
                  hintText: 'Confrim Password'
                ),
              ),
            ),
          ),
        ),

        
        SizedBox(height: 15),

        //Register Button
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
              MaterialPageRoute(builder: (context) => User_Login())
              );
            },
            child: Text(
              'Register'
              ),
            ),
          ),
        ),
        
        SizedBox(height: 25),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Register Using Phone Number',

              style: TextStyle(
                color: Colors.blue,
                
              ),
              
              ),
          ],
        ),
         
        ],)
        ),
        ),
      );
    }
  }



  

  