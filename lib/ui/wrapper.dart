import 'package:firebase_auth_gorgeous_login/models/app_gaurd.dart';
import 'package:firebase_auth_gorgeous_login/ui/home.dart';
import 'package:firebase_auth_gorgeous_login/ui/login_page.dart';
import 'package:firebase_auth_gorgeous_login/ui/signIn.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}
class _WrapperState extends State<Wrapper> {

  @override
  Widget build(BuildContext context) {

   final  appGuard = Provider.of<AppGuard>(context);
    print("In wrapper");
    if(appGuard!=null) {
      print ( appGuard.uid );
      print ( appGuard.isVerified );
    }
    if(appGuard==null ){
      return LoginPage();
    }else{
      return appGuard.isVerified ? Home():LoginPage();
    }
  }
}
