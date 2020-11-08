import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_gorgeous_login/models/local_user.dart';
import 'package:firebase_auth_gorgeous_login/ui/signIn.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  Future  signInWithGoogle(credentials)async{
   final result = await _auth.signInWithCredential(credentials);
   print("signInWithGoogle");
   print("CurrentUser=${googleSignIn.currentUser}");
   return result;

  }

Future signInWithEmailAndPassword(String email,String password)async{
    try{
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
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
  }


  resetPassword(String email)async{
    print("resetPassword");
    print(email);
    await _auth.sendPasswordResetEmail(email:email );
  }

}