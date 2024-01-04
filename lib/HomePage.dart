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
                currentAccountPicture:Stack(
                  children: [
                    CircleAvatar(
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
                    ),
                    Positioned(
                      bottom: -5,
                      left: 35,
                      child: IconButton(
                        icon: Icon(Icons.camera_enhance,size:size.height*0.03 ,color: Colors.black,),
                        onPressed: () async {

                          /*  ImagePicker imagePicker = ImagePicker();
                      print(imagePicker);
                      XFile? file = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      print(file?.path);

                      if (file!.path.isNotEmpty) {
                        setState(() {
                          profile_update = true;
                        });
                        // Create reference of Firebase Storage

                        Reference reference =
                        FirebaseStorage.instance.ref();

                        // Create Directory into Firebase Storage

                        Reference image_directory =
                        reference.child("User_profile");

                        Reference image_folder = image_directory
                            .child("${usermodel["Email"]}");

                        await image_folder
                            .putFile(File(file!.path))
                            .whenComplete(
                              () async {
                            String download_url =
                            await image_folder.getDownloadURL();
                            print("uploaded");
                            print(download_url);
                            await FirebaseFirestore.instance
                                .collection("Teachers")
                                .doc(FirebaseAuth
                                .instance.currentUser?.email)
                                .update({
                              "Profile_URL": download_url,
                            }).whenComplete(() async {
                              await FirebaseFirestore.instance
                                  .collection("Teachers")
                                  .doc(FirebaseAuth
                                  .instance.currentUser!.email)
                                  .get()
                                  .then((value) {
                                setState(() {
                                  usermodel = value.data()!;
                                });
                              }).whenComplete(() {
                                setState(() {
                                  profile_update = false;
                                });
                              });
                            });
                            setState(() {
                              profile_update = false;
                            });
                          },
                        );
                      }*/
                        } ,
                      ),
                    )
                  ],
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
                                  style: GoogleFonts.tiltNeon(
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
                                  style: GoogleFonts.tiltNeon(
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
              SizedBox(
                height: size.height,
                width: size.width,
                child: tabs[currTab],
              )
            ],
          ),
        ),
      ),
    );
  }
}
