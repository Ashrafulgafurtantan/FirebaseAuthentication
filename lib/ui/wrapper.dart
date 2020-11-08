import 'package:firebase_auth_gorgeous_login/models/local_user.dart';
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
 // LocalUser localUser;


  @override
  Widget build(BuildContext context) {

   final  localUser = Provider.of<LocalUser>(context);
    print("In wrapper");
    if(localUser!=null) {
      print ( localUser.uid );
      print ( localUser.isVerified );
    }
    if(localUser==null ){
      return LoginPage();
    }else{
      return localUser.isVerified ? Home():LoginPage();
    }
  }
}
