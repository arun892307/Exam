import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inapp_notifications/flutter_inapp_notifications.dart';
import 'package:learning_ptalform/Authentication/Login.dart';

import 'Constraints.dart';
import 'HomePage.dart';





class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> {
  bool loaded=false;
  bool docExist=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var temp=FirebaseAuth.instance.currentUser;
    if(temp!=null){
      fetchuser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (_, snapshot)  {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LogIn();
          } else if (snapshot.connectionState == ConnectionState.active && !snapshot.hasData) {
            return const LogIn();
          } else if (snapshot.connectionState == ConnectionState.active && snapshot.hasData)
          {
            if(FirebaseAuth.instance.currentUser!.emailVerified){

              return
                loaded
                    ?
                docExist
                    ?
                const HomePage()
                    :
                const AutoSizeText("User Details needed...")
                    :
                const AutoSizeText("Data is Reteriving From Server...");
            }
            else{
              FirebaseAuth.instance.currentUser!.sendEmailVerification();
              InAppNotifications.instance
                ..titleFontSize = 14.0
                ..descriptionFontSize = 14.0
                ..textColor = Colors.black
                ..backgroundColor =
                const Color.fromRGBO(150, 150, 150, 1)
                ..shadow = true
                ..animationStyle =
                    InAppNotificationsAnimationStyle.scale;
              InAppNotifications.show(
                duration: const Duration(seconds: 4),
                description: "Please verify your email.",);
              FirebaseAuth.instance.signOut();
              return const LogIn();
            }
          }
          else{
            return const LogIn();}
        },

      );
  }
  Future<void> fetchuser() async {
    if(!loaded){
      print("Before Entering.........");
      await FirebaseFirestore.instance.collection("User Details").doc(FirebaseAuth.instance.currentUser?.email).get().then((value) async {
        print("Inside query..........");
        print("....${value.data()!=null}");


        if(value.data() !=null){
          usermodel = value.data()!;
          print(usermodel);
          print("Data is not Empty.......");
          setState(() {
            if (kDebugMode) {
              print(usermodel);
            }
            docExist=true;
            loaded=true;
          });
        }
        else{
          setState(() {
            loaded=true;
          });
        }
      });
    }

  }
}
