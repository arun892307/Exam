import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_ptalform/loadingscreen.dart';
import 'TakeQuize.dart';
import 'instrauctionsOfQuize.dart';

class PracticePapers extends StatefulWidget {
  const PracticePapers({Key? key}) : super(key: key);

  @override
  State<PracticePapers> createState() => _PracticePapersState();
}

class _PracticePapersState extends State<PracticePapers> {
  final TextEditingController question=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Test").snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasData ?
          ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 7,
                child: ListTile(
                  title:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height*0.012,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText("Practice Test ${index+1}",
                            style: GoogleFonts.openSans(
                              fontSize: size.height*0.02,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                            ),),
                          Container(
                            height: size.height*0.023,
                            width: size.width*0.1,
                            decoration:BoxDecoration(
                                color: Colors.green,
                                border: Border.all(
                                    color: Colors.black,
                                    width: 1
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(size.height*0.008))
                            ),
                            child: Center(
                              child: AutoSizeText(
                                "Free",
                                style: GoogleFonts.openSans(
                                    fontSize: size.height*0.015,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height*0.012,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Row(
                          children: [
                            AutoSizeText("${snapshot.data?.docs[index]["Questions"].length} Qs. | ",
                                style: GoogleFonts.openSans(
                                    fontSize: size.height*0.015,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400
                                )),
                            AutoSizeText("12 mins | ",
                                style: GoogleFonts.openSans(
                                    fontSize: size.height*0.015,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400
                                )),
                            AutoSizeText("12 Marks",
                                style: GoogleFonts.openSans(
                                    fontSize: size.height*0.015,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400
                                ))
                          ],
                        ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const QuizInstructions();
                              },));
                            },
                            child: Container(
                              height: size.height*0.031,
                              width: size.width*0.16,
                              decoration:BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(size.height*0.008))
                              ),
                              child: Center(
                                child: AutoSizeText(
                                  "Start Test",
                                  style: GoogleFonts.openSans(
                                      fontSize: size.height*0.01,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height*0.009,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              AutoSizeText("Status :  Not Attempted",
                                  style: GoogleFonts.openSans(
                                      fontSize: size.height*0.015,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height*0.015,
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const QuizInstructions();
                    },));
                  },
                ),
              );
            },
          )
              :
          const loading(text: "Please wait...");
        },
      ),
    );
  }
}
