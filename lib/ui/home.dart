import 'package:firebase_auth_gorgeous_login/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: IconButton(
            icon: Icon(Icons.logout,size: 40,),
            onPressed: ()async{
             await  AuthService().signOut();
            },
            color: Colors.pinkAccent,
          ),
        ),
      ),
    );
  }
}
