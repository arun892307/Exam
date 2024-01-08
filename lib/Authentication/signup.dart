import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inapp_notifications/flutter_inapp_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_ptalform/MainPage.dart';
import 'package:page_transition/page_transition.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  bool hide = true;
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
                    height: size.height * 0.093,
                    width: size.height * 0.093,
                    decoration: const BoxDecoration(
                        color: Colors.white10,
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
                          "SIGN UP",
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: size.height * 0.034),
                        ),
                        AutoSizeText(
                          "Please Create your account",
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
                  Padding(
                    padding: EdgeInsets.only(left: size.height * 0.022,right: size.height * 0.022,top: size.height * 0.022),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.height * 0.025,
                              bottom: size.height * 0.004),
                          child: SizedBox(
                            child: AutoSizeText(
                              "Enter Your Email",
                              style: GoogleFonts.openSans(
                                  color: Colors.black,
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
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.height * 0.018),
                                    borderSide: const BorderSide(
                                        width: 1.5, style: BorderStyle.solid)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.height * 0.018),
                                    borderSide: const BorderSide(
                                        width: 1, style: BorderStyle.solid)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.height * 0.018),
                                    borderSide: const BorderSide(
                                        width: 1.5, style: BorderStyle.solid)),
                              ),
                              keyboardType: TextInputType.emailAddress),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.height * 0.022,right: size.height * 0.022,top: size.height * 0.013),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.height * 0.025,
                              bottom: size.height * 0.004),
                          child: SizedBox(
                            child: AutoSizeText(
                              "Enter Your Name",
                              style: GoogleFonts.openSans(
                                  color: Colors.black,
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
                              controller: _name,
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
                                    Icons.person,
                                    color: Colors.black87,
                                  ),
                                  label: const Text("Enter Your Name"),
                                  labelStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.9)),
                                  filled: true,
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                                  fillColor: Colors.white.withOpacity(0.7),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.height * 0.018),
                                    borderSide: const BorderSide(
                                        width: 1.5, style: BorderStyle.solid)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.height * 0.018),
                                    borderSide: const BorderSide(
                                        width: 1, style: BorderStyle.solid)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.height * 0.018),
                                    borderSide: const BorderSide(
                                        width: 1.5, style: BorderStyle.solid)),
                              ),
                              keyboardType: TextInputType.emailAddress),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.height * 0.022,right: size.height * 0.022,top: size.height * 0.014),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.height * 0.025,
                              bottom: size.height * 0.004),
                          child: SizedBox(
                            child: AutoSizeText(
                              "Enter Your Password",
                              style: GoogleFonts.openSans(
                                  color: Colors.black,
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
                              controller: _password,
                              obscureText: hide,
                              enableSuggestions: false,
                              autocorrect: false,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  color: Colors.black26.withOpacity(0.9)),
                              decoration: InputDecoration(
                                  suffixIcon: hide
                                      ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        hide = !hide;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.visibility_off_outlined,
                                      color: Colors.black,
                                    ),
                                  )
                                      : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          hide = !hide;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.visibility_outlined,
                                        color: Colors.black,
                                      )),
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Colors.black,
                                  ),
                                  label: const Text("Enter Password"),
                                  labelStyle: TextStyle(
                                      color: Colors.black26.withOpacity(0.9)),
                                  filled: true,
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                                  fillColor: Colors.white.withOpacity(0.7),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          size.height * 0.018),
                                      borderSide: const BorderSide(
                                          width: 1.5, style: BorderStyle.solid)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.height * 0.018),
                                    borderSide: const BorderSide(
                                        width: 1, style: BorderStyle.solid)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.height * 0.018),
                                    borderSide: const BorderSide(
                                        width: 1.5, style: BorderStyle.solid)),
                              ),
                              keyboardType: TextInputType.visiblePassword),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.075,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.08),
                    child: InkWell(
                      onTap: () async {
                        if(_email.text.trim().isNotEmpty && _name.text.trim().isNotEmpty && _password.text.trim().isNotEmpty){
                          String temp = await signIn(_email.text.trim(), _password.text.trim());
                          await FirebaseAuth.instance.currentUser!.sendEmailVerification();
                          final record = await FirebaseFirestore.instance.collection("User Details").doc(_email.text.trim()).get();
                          record.exists
                              ?
                          null
                              :
                          await FirebaseFirestore.instance.collection("User Details").doc(_email.text.trim()).set({
                            "Email": _email.text.trim(),
                            "Name":_name.text.trim()
                          }).whenComplete(() async {
                            await FirebaseAuth.instance.signOut().whenComplete(() {
                              Navigator.pop(context);
                            });
                          });

                          if(temp=='1'){
                            InAppNotifications.instance
                              ..titleFontSize = 14.0
                              ..descriptionFontSize = 14.0
                              ..textColor = Colors.black
                              ..backgroundColor = const Color.fromRGBO(150, 150, 150, 1)
                              ..shadow = true
                              ..animationStyle = InAppNotificationsAnimationStyle.scale;
                            InAppNotifications.show(
                                title: 'Successfully',
                                duration: const Duration(seconds: 2),
                                description: 'Your account is created successfully. Please verify your email',
                                leading: const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 55,
                                )
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
                                description: temp,
                                leading: const Icon(
                                  Icons.error_outline_outlined,
                                  color: Colors.red,
                                  size: 55,
                                )
                            );
                          }
                        }
                        else{
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
                              description: "Email id can not be empty",
                              leading: const Icon(
                                Icons.error_outline_outlined,
                                color: Colors.red,
                                size: 55,
                              ));
                        }
                      },
                      child: Container(
                        height: size.height * 0.065,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
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
                              "SIGN UP",
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
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: const MainPage(),
                                  type: PageTransitionType.leftToRightJoined,
                                  childCurrent: const CreateAccount(),
                                  duration: const Duration(milliseconds: 350)));
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
                                      color: Colors.green,
                                      fontWeight: FontWeight.w700,
                                      fontSize: size.height * 0.021)),
                              Container(
                                height: size.height * 0.036,
                                width: size.height * 0.036,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(
                                        size.height * 0.036),
                                    image: const DecorationImage(image: AssetImage("assets/icon/fm.png"),
                                      fit: BoxFit.fill,)),
                              )
                            ],
                          ),
                        ),
                      ),
                      AutoSizeText(
                        "Already have Account Please Log In",
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: size.height * 0.01),
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
  Future<String> signIn(String email, String password) async {
    try {
      await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return "1";
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return e.toString().split(']')[1].trim();
    }
  }
}
