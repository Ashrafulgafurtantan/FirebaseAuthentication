import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnonymus()async{
    try{
      final result = await _auth.signInAnonymously();
      User user = result.user;
      return user;

    }catch(e){
      print(e.toString());
      return null;
    }
  }
}