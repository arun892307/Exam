import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inapp_notifications/flutter_inapp_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'Login.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _email = TextEditingController();
  final _key = GlobalKey<FormState>();
  String validEmail="Enter Your Email";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: false,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: size.height * 1,
              width: size.width * 1,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(size.height * 0.5)),
                  image: const DecorationImage(image: AssetImage("assets/images/railway.jpg"),
                    fit: BoxFit.cover,)),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.075,
                  ),
                Container(
                  height: size.height * 0.13,
                  width: size.height * 0.13,
                  decoration: const BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage("assets/icon/fm.png"),
                        fit: BoxFit.fill,)),
                ),
                  SizedBox(
                    height: size.height * 0.022,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        AutoSizeText(
                          "FORGOT PASSWORD",
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: size.height * 0.032),
                        ),
                        AutoSizeText(
                          "Please Create New Password",
                          style: GoogleFonts.openSans(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: size.height * 0.018),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.036,
                  ),
                  Form(
                    key: _key,
                      child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.022),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.height * 0.025,
                                bottom: size.height * 0.004),
                            child: SizedBox(
                              child: AutoSizeText(
                                validEmail,
                                style: GoogleFonts.openSans(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.height * 0.016),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 8,
                            shape: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(size.height * 0.018),
                                borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                    style: BorderStyle.none)),
                            color: Colors.white,
                            child: TextFormField(
                                validator: (value) {
                                  if (value!.contains('@')) {
                                    return null;
                                  } else {
                                    setState(() {
                                      validEmail='Please enter a valid email address';
                                    });
                                    return null;
                                  }
                                },
                                controller: _email,
                                obscureText: false,
                                enableSuggestions: true,
                                autocorrect: true,
                                cursorColor: Colors.black,
                                style: TextStyle(
                                    color: Colors.black26.withOpacity(0.9),
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _email.clear();
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.clear_outlined,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.mail_outline_outlined,
                                      color: Colors.black87,
                                    ),
                                    label: const Text("Enter Email"),
                                    labelStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.9)),
                                    filled: true,
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                    fillColor: Colors.white.withOpacity(0.7),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            size.height * 0.018),
                                        borderSide: const BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                            style: BorderStyle.solid)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            size.height * 0.018),
                                        borderSide: const BorderSide(
                                            color: Colors.black,
                                            width: 1.5,
                                            style: BorderStyle.solid)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            size.height * 0.018),
                                        borderSide: const BorderSide(
                                            color: Colors.black,
                                            width: 1.5,
                                            style: BorderStyle.none))),
                                keyboardType: TextInputType.emailAddress),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.08),
                      child: InkWell(
                        onTap: () async {
                          if(_email.text.isNotEmpty )
                          {
                            if (_key.currentState!.validate())
                            {
                              String test=await forgot(_email.text.trim());
                              if(!mounted) return;
                              if(test=="1"){
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const LogIn(),
                                      type: PageTransitionType.scale,
                                      duration: const Duration(milliseconds: 400),
                                      alignment: Alignment.bottomCenter),
                                );
                              }
                              else{
                                InAppNotifications.instance
                                  ..titleFontSize = 14.0
                                  ..descriptionFontSize = 14.0
                                  ..textColor = Colors.black
                                  ..backgroundColor = const Color.fromRGBO(150, 150, 150, 1)
                                  ..shadow = true
                                  ..animationStyle = InAppNotificationsAnimationStyle.scale;
                                InAppNotifications.show(
                                    title: 'Failed',
                                    duration: const Duration(seconds: 2),
                                    description: test,
                                    leading: const Icon(
                                      Icons.error_outline_outlined,
                                      color: Colors.red,
                                      size: 55,
                                    )
                                );
                              }
                            }
                          }
                         /* else{
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
                                title: 'Failed',
                                duration: const Duration(seconds: 2),
                                description: "Please Enter Valid Email",
                                leading: const Icon(
                                  Icons.error_outline_outlined,
                                  color: Colors.red,
                                  size: 55,
                                ));
                          }*/
                        },
                        child: Container(
                          height: size.height * 0.065,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(size.height * 0.043),
                                topRight: Radius.circular(size.height * 0.043)
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.transparent, Colors.white],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AutoSizeText(
                                "SEND EMAIL",
                                style: GoogleFonts.openSans(
                                    color: Colors.green.shade700,
                                    fontWeight: FontWeight.w800,
                                    fontSize: size.height * 0.023),
                              ),
                              SizedBox(
                                width: size.width*0.05,
                              ),
                              Container(
                                height: size.height * 0.05,
                                width: size.height * 0.05,
                                decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: AssetImage("assets/icon/fm.png"),
                                      fit: BoxFit.fill,)),
                              ),
                              SizedBox(
                                width: size.width*0.02,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],))
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.9, left: size.width * 0.03),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: size.height * 0.048,
                          width: size.width * 0.3,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText("LOG IN",
                                  style: GoogleFonts.openSans(
                                      color: Colors.green.shade700,
                                      fontWeight: FontWeight.w700,
                                      fontSize: size.height * 0.023)),
                              Container(
                                height: size.height * 0.04,
                                width: size.height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(
                                        size.height * 0.036),
                                    image: const DecorationImage(image: AssetImage("assets/icon/fm.png"),
                                      fit: BoxFit.fill,)),
                              ),

                            ],
                          ),
                        ),
                      ),
                      AutoSizeText(
                        "Please Log In your account",
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: size.height * 0.014),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<String> forgot(String email) async {
    try {
      await  FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return "1";
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return e.toString().split(']')[1].trim();
    }
  }
}
