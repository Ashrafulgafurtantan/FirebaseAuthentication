import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser{

  final String username;
  final  String email;
  final  String displayName;
  final  String photoURL;


  AppUser({this.email,this.displayName,this.username,this.photoURL});

  factory AppUser.fromDocument(DocumentSnapshot doc,String email){
    return AppUser(
      displayName: doc['displayName'],
      email   :email,
      photoURL  :doc['photoURL'],
      username  :doc['username'],
    );
  }

  @override
  String toString() {
    return 'AppUser{username: $username, email: $email, displayName: $displayName, photoURL: $photoURL}';
  }
}