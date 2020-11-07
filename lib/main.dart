import 'package:firebase_auth_gorgeous_login/models/local_user.dart';
import 'package:firebase_auth_gorgeous_login/models/switcher.dart';
import 'package:firebase_auth_gorgeous_login/services/auth.dart';
import 'package:firebase_auth_gorgeous_login/ui/login_page.dart';
import 'package:firebase_auth_gorgeous_login/ui/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



AuthService authService=AuthService();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        Provider<bool>.value(value:authService.isVerifiedChange() ),
      StreamProvider<LocalUser>.value( value: authService.user,),

      ],

      child: MaterialApp(
        title: 'TheGorgeousLogin',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
          child: Wrapper(),
          create: (context)=>Switcher(),
        ),
      ),
    );
  }
}