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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late TabController _tabController;
  int currTab=0;
  List<Widget> tabs=[const PracticePapers(),const PreviousYearPaper()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
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
              leading: Icon(Icons.home,),
                title: const Text("Home"),
                onTap: (){
                 Navigator.pop(context);
                }
            ),
            ListTile(
                leading: Icon(Icons.settings,),
                title: const Text("Settings"),
                onTap: (){
                  Navigator.pop(context);
                }
            ),
            ListTile(
                leading: const Icon(Icons.leaderboard_rounded,),
                title: const Text("LeaderBoard"),
                onTap: (){

                }
            ),
            ListTile(
                leading: Icon(Icons.logout,),
                title: const Text("Log Out"),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                }
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: AutoSizeText(
          "Start Your Learning",
          style: GoogleFonts.openSans(
            color: Colors.black,
            fontSize: size.height*0.022,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: Container(
        height: size.height*1,
        width: size.width*1,
        decoration: const BoxDecoration(
            color:Colors.white
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: size.height,
                width: size.width,
                child: tabs[currTab],
              )
            ],
          ),
        ),
      ),
      bottomSheet: SizedBox(
        height: size.height * 0.06,
        width: size.width * 1,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.green,

              controller: _tabController,
              onTap: (value) {
                setState(() {
                  currTab=value;
                });
              },
              tabs: [
                SizedBox(
                  height: size.height*0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: size.width*0.065,
                        child: Image.asset("assets/icon/practicepaper.png"),
                      ),
                      SizedBox(
                        width: size.width*0.02,
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: AutoSizeText(
                          "Practice Paper",
                          style: GoogleFonts.openSans(
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: size.width*0.065,
                        child: Image.asset("assets/icon/previousyearPaper.png"),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: AutoSizeText(
                          "Previous Paper",
                          style: GoogleFonts.openSans(
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
