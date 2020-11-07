import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_gorgeous_login/models/local_user.dart';
  class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  LocalUser localUser;
  bool switcher=false;
  Stream<LocalUser>get user{
  
    return _auth.userChanges().map((User firebaseUser){
       localUser =firebaseUser==null ?  null : LocalUser(uid: firebaseUser.uid,isVerified: firebaseUser.emailVerified);
      print("In streamBuilder");
       print(switcher);
      return localUser;
    });
  }


  Future signInAnonymus()async{
    try{
      final result = await _auth.signInAnonymously();
      User user = result.user;//Firebase User
      return user;

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut()async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }
Future signInWithEmailAndPassword(String email,String password)async{
    try{
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      print("In auth signin Method");
//     _auth.currentUser..reload();
//      user = _auth.currentUser;
   //   Stream<User> uuu = await _auth.userChanges();
   //   print(user.emailVerified);



//      if(user.emailVerified){
//        print("yes verified");
//        return user;
//      }else{
//        print("Not verified");
//        return null;
//      }

      return user;

    }catch(e){
      print(e.toString());
      return null;
    }
}
  Future signUpWithEmailAndPassword(String email,String pass)async{

    try{
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      print("In auth signUp function ");
      User user = result.user;
      await user.sendEmailVerification();
      return user;


    }catch(e){
      print(e.toString());
      return null;
    }







//    try{
//      final result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
//
//      print("in auth");
//      print(result);
//      if(result==null){
//        print("Invalid email from firebase");
//      }
//      User user = result.user;//Firebase User
//      print("in auth");
//      print(user);
//      return user;
//
//    }catch(e){
//      print(e.toString());
//      return null;
//    }


  }


}