import 'package:firebase_auth_gorgeous_login/models/local_user.dart';
import 'package:firebase_auth_gorgeous_login/models/switcher.dart';
import 'package:firebase_auth_gorgeous_login/services/auth.dart';
import 'package:firebase_auth_gorgeous_login/ui/home.dart';
import 'package:firebase_auth_gorgeous_login/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final localUser = Provider.of<LocalUser>(context);
    var switcher = Provider.of<Switcher>(context);
    print("In wrapper");
    print(localUser);

//    switcher.isVerifiedChange();
//        return Consumer<AuthService>(builder:(context,data,child){
//          return data.switcher? Home():LoginPage();
//        } );

    //  return LoginPage(switcher: switcher);

  //  return switcher.getValue() ? Home():LoginPage(switcher: switcher,);

         if(localUser==null ){
           return LoginPage();
         }else{
           print("In wrapper");
           print(switcher);
             return localUser.isVerified ? Home():LoginPage();
         }



  }
}
