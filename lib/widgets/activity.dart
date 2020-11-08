import 'package:firebase_auth_gorgeous_login/main.dart';
import 'package:firebase_auth_gorgeous_login/ui/signIn.dart';
import 'package:flutter/material.dart';
class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: MaterialButton(
          color: Colors.pink,
          child: Text("SignOut"),
          onPressed: (){
              googleSignIn.signOut();
              authService.signOut();
          },
        )),
      ),
    );
  }
}
