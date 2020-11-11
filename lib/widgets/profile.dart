import 'package:firebase_auth_gorgeous_login/main.dart';
import 'package:firebase_auth_gorgeous_login/models/app_user.dart';
import 'package:firebase_auth_gorgeous_login/ui/signIn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth_gorgeous_login/ui/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  AppUser profileId;
  Profile(this.profileId);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

bool isFollower= false;

  unFollowingController()async{
   DocumentSnapshot doc =  await followingRef.doc(thisDeviceAppUser.email).collection("userFollowings").doc( widget.profileId.email).get();
   DocumentSnapshot coc=  await followerRef.doc(widget.profileId.email).collection("userFollowers").doc(thisDeviceAppUser.email).get();

   if(doc.exists){
     doc.reference.delete();
   }
   if(coc.exists){
     coc.reference.delete();
   }
    setState(() {
      isFollower=false;
    });
  }


  followingController()async {
    await followingRef.doc(thisDeviceAppUser.email).collection("userFollowings").doc( widget.profileId.email).set({});
    await followerRef.doc(widget.profileId.email).collection("userFollowers").doc(thisDeviceAppUser.email).set({});
    setState(() {
      isFollower=true;
    });
  }
getIsFollowerInfo()async{
  DocumentSnapshot doc= await followingRef.doc(thisDeviceAppUser.email).collection("userFollowings").doc( widget.profileId.email).get();
  if(doc.exists){
    setState(() {
      isFollower=true;
    });
  }else{
    setState(() {
      isFollower=false;
    });
  }
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIsFollowerInfo();
  }
  Widget isOwnProfile(){
  return  FlatButton(onPressed: (){
      googleSignIn.signOut();
      authService.signOut();
    }, child: Center(child: Text("SignOut")));
  }


  Widget isNotOwnProfile(){
    return isFollower? IconButton(icon: Icon(FontAwesomeIcons.userMinus,size: 40,color: Colors.redAccent,),
      onPressed: (){
        unFollowingController();
      },
    )  :

    IconButton(icon: Icon(FontAwesomeIcons.userPlus,size: 40,color: Colors.blueAccent,),
      onPressed: (){

        followingController();
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Center(child: thisDeviceAppUser.email== widget.profileId.email? isOwnProfile(): isNotOwnProfile()),
      ),
    );
  }
}

