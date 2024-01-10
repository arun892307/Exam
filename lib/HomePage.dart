import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_ptalform/practice_paper.dart';
import 'package:learning_ptalform/previous_year_papers.dart';
import 'Constraints.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  List<Widget> tabs=[const PracticePapers(),const PreviousYearPaper()];
  int index = 0;
  double sliderPos= 10;
  double sliderLen= 85;
  Color themeColor = Colors.white;
  Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black87,
      // decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //       colors: [
      //         Color.fromRGBO(156, 190, 244, 1),
      //         Color.fromRGBO(194, 232, 251, 1),
      //       ],
      //     )
      // ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: Drawer(
          backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.black,
                        Colors.blueAccent,
                        Colors.purple,
                      ],
                    ),
                  ),
                  accountName: AutoSizeText(
                    usermodel["Name"],
                    style: GoogleFonts.exo(
                        fontSize: size.height * 0.022,
                        fontWeight: FontWeight.w600),
                  ),
                  accountEmail: AutoSizeText(
                    usermodel["Email"],
                    style: GoogleFonts.exo(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w600),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: size.height*0.2,

                    backgroundImage:usermodel["Profile_URL"]!=null?

                    NetworkImage(usermodel["Profile_URL"])
                        :
                    null,
                    // backgroundColor: Colors.teal.shade300,
                    child: usermodel["Profile_URL"]==null?
                    AutoSizeText(
                      usermodel["Name"].toString().substring(0,1),
                      style: GoogleFonts.exo(
                          fontSize: size.height * 0.05,
                          fontWeight: FontWeight.w600),
                    )
                        :
                    null,
                  )
              ),
              ListTile(
                iconColor: iconColor,
                leading: const Icon(Icons.home,),
                  title: AutoSizeText("Home",style: GoogleFonts.openSans(
                    color: themeColor
                  ),),
                  onTap: (){
                   Navigator.pop(context);
                  }
              ),
              ListTile(
                  iconColor: iconColor,
                  leading: const Icon(Icons.settings,),
                  title: AutoSizeText("Settings",style: GoogleFonts.openSans(
                      color: themeColor
                  ),),
                  onTap: (){
                    Navigator.pop(context);
                  }
              ),
              ListTile(
                  iconColor: iconColor,
                  leading: const Icon(Icons.leaderboard_rounded,),
                  title: AutoSizeText("LeaderBoard",style: GoogleFonts.openSans(
                      color: themeColor
                  ),),
                  onTap: (){

                  }
              ),
              ListTile(
                  iconColor: iconColor,
                  leading: const Icon(Icons.logout,),
                  title: AutoSizeText("Log Out",style: GoogleFonts.openSans(
                      color: themeColor
                  ),),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                  }
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          //const Color.fromRGBO(156, 190, 244, 1),
          elevation: 0,
          title: AutoSizeText(
            "Start Your Learning",
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: size.height*0.022,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        body: tabs[index],
        bottomNavigationBar: Container(
          height: size.height * 0.055,
          margin: EdgeInsets.fromLTRB(size.width*0.03,5,size.width*0.03,size.height*0.01),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(15),),
          ),
          child: Stack(
            children: [
              Container(
                height: size.height * 0.055,
                decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          index = 0;
                          sliderPos= size.width*0.03;
                          sliderLen=size.width*0.2;
                        });
                      },
                      child: Row(
                        children: [
                          Container(

                            width: size.width*0.1,
                            height: size.height*0.035,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                image: AssetImage("assets/images/house.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          AutoSizeText("Home",style: GoogleFonts.openSans(color: themeColor),)
                        ],
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          index = 0;
                          sliderPos= size.width*0.25;
                          sliderLen=size.width*0.36;
                        });
                      },
                      child: Row(
                        children: [
                          Container(

                            width: size.width*0.1,
                            height: size.height*0.035,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                image: AssetImage("assets/icon/target.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          AutoSizeText("Practice Papers",style: GoogleFonts.openSans(color: themeColor),)
                        ],
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          index = 1;
                          sliderPos= size.width*0.62;
                          sliderLen=size.width*0.3;
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            width: size.width*0.08,
                            height: size.height*0.04,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                image: AssetImage("assets/icon/exam.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          AutoSizeText("Exam Papers",style: GoogleFonts.openSans(color: themeColor),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                height: size.height*0.055,
                left: sliderPos,
                duration: const Duration(milliseconds: 300),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: sliderLen,
                      height: size.height*0.0055,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(156, 190, 244, 1),
                                Color.fromRGBO(194, 232, 251, 1),
                              ])
                      ),
                    ),
                    Container(
                      width: sliderLen,
                      height: size.height*0.0055,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(156, 190, 244, 1),
                                Color.fromRGBO(194, 232, 251, 1),
                              ]),
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
