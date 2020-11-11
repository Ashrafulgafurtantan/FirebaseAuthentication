import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_gorgeous_login/models/app_user.dart';
import 'package:firebase_auth_gorgeous_login/ui/signIn.dart';
import 'package:firebase_auth_gorgeous_login/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  Future<QuerySnapshot> querySnapshot;
  TextEditingController findUserController;
  @override
  void initState() {
    super.initState();
    findUserController=TextEditingController();
  }
  @override
  void dispose() {
    super.dispose();
    findUserController.dispose();
  }

   getUserLink()async{
  print("findUserController.text ${findUserController.text}");
   Future<QuerySnapshot> users =  userRef.where("username",isGreaterThanOrEqualTo: findUserController.text).get();
   setState(() {
     querySnapshot=users;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Padding(
          padding: EdgeInsets.only(
              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
          child: TextField(
            autofocus: true,
            cursorWidth: 3,
            cursorColor: Colors.grey,
            
            controller:findUserController ,
            keyboardType: TextInputType.text,
            style: TextStyle(
                fontFamily: "WorkSansSemiBold",
                fontSize: 16.0,
                color: Colors.grey),
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                FontAwesomeIcons.userTie,
                color:  Colors.black,
                size: 22.0,
              ),
              hintText: "Search Friends...",
              hintStyle: TextStyle(
                  fontFamily: "WorkSansSemiBold", fontSize:17.0,color: Colors.grey),
            ),
          ),
        ),
        actions: [
          IconButton(icon: Icon(FontAwesomeIcons.search,color: Colors.black,size: 22,), onPressed:getUserLink),
        ],
      ),
      body: querySnapshot==null ? Container(child: Center(
        child: Text("No Users",style: TextStyle(
          fontSize: 25,
        ),),
      ),) :
      FutureBuilder(
        future: querySnapshot,
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          List<AppUser> usernameList=[];
        //  List<Text> usernameList=[];
          snapshot.data.docs.forEach(( doc){
            print(doc['email']);
            String email = doc['email'];
            print("email 0.5");
            AppUser user = AppUser.fromDocument(doc,email );
          //  usernameList.add(Text(user.username));
            usernameList.add(user);
            print("email 0.75");
            print("email 1");
          });
          print("email 2");

          return ListView.builder(
            itemCount: usernameList.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  print("On tap...");
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Profile(usernameList[index]);
                  }));
                },
                child : Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                    child: Text(usernameList[index].username),
               //   child: Text(usernameList[index]),
                ),
              );
            },
          );
        },
      )
    );
  }
}
/*ListView.builder(
            itemCount: usernameList.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  print("On tap...");
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Profile(usernameList[index]);
                  }));
                },
                child : Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                //  child: Text(usernameList[index].displayName),
                  child: Text(usernameList[index]),
                ),
              );
            },
          );*/