import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_ptalform/loadingscreen.dart';
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
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          Card(
            child: Column(
              children: [
                AutoSizeText("Electrical",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                AutoSizeText("Practice Papers: 10",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),

              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                AutoSizeText("Electrical",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                AutoSizeText("Practice Papers: 10",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),

              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                AutoSizeText("Electrical",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                AutoSizeText("Practice Papers: 10",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),

              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                AutoSizeText("Electrical",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                AutoSizeText("Practice Papers: 10",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),

              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                AutoSizeText("Electrical",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                AutoSizeText("Practice Papers: 10",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),

              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                AutoSizeText("Electrical",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                AutoSizeText("Practice Papers: 10",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),

              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                AutoSizeText("Electrical",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                AutoSizeText("Practice Papers: 10",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),

              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                AutoSizeText("Electrical",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                AutoSizeText("Practice Papers: 10",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),

              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                AutoSizeText("Electrical",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                AutoSizeText("Practice Papers: 10",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),

              ],
            ),
          ),
        ],
      )


      // StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection("Test").snapshots(),
      //   builder: (context, snapshot) {
      //     return snapshot.hasData ?
      //     ListView.builder(
      //       shrinkWrap: true,
      //       itemCount: snapshot.data?.docs.length,
      //       itemBuilder: (context, index) {
      //         return Card(
      //           elevation: 7,
      //           child: ExpansionTile(
      //             iconColor: Colors.black,
      //             title: AutoSizeText("Practice Test ${index+1}",
      //               style: GoogleFonts.openSans(
      //                 fontSize: size.height*0.022,
      //                 color: Colors.black,
      //                 fontWeight: FontWeight.w600
      //               ),),
      //             subtitle: Column(
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Row(
      //                       children: [
      //                         AutoSizeText("${snapshot.data?.docs[index]["Questions"].length} Qs. | ",
      //                             style: GoogleFonts.openSans(
      //                                 fontSize: size.height*0.015,
      //                                 color: Colors.black,
      //                                 fontWeight: FontWeight.w400
      //                             )),
      //                         AutoSizeText("12 mins | ",
      //                             style: GoogleFonts.openSans(
      //                                 fontSize: size.height*0.015,
      //                                 color: Colors.black,
      //                                 fontWeight: FontWeight.w400
      //                             )),
      //                         AutoSizeText("12 Marks",
      //                             style: GoogleFonts.openSans(
      //                                 fontSize: size.height*0.015,
      //                                 color: Colors.black,
      //                                 fontWeight: FontWeight.w400
      //                             ))
      //                       ],
      //                     ),
      //                     Container(
      //                       height: size.height*0.025,
      //                       width: size.width*0.1,
      //                       decoration:BoxDecoration(
      //                           color: Colors.green,
      //                           border: Border.all(
      //                               color: Colors.black,
      //                               width: 1
      //                           ),
      //                           borderRadius: BorderRadius.all(Radius.circular(size.height*0.008))
      //                       ),
      //                       child: Center(
      //                         child: AutoSizeText(
      //                           "Free",
      //                           style: GoogleFonts.openSans(
      //                               fontSize: size.height*0.015,
      //                               color: Colors.black,
      //                               fontWeight: FontWeight.w500
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   height: size.height*0.005,
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Row(
      //                       children: [
      //                         AutoSizeText("Status :  Not Attempted",
      //                             style: GoogleFonts.openSans(
      //                                 fontSize: size.height*0.015,
      //                                 color: Colors.black,
      //                                 fontWeight: FontWeight.w400
      //                             )),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //             children: [
      //               ListTile(
      //                 title: AutoSizeText(
      //                   "Start Test",
      //                   style: GoogleFonts.openSans(
      //                       fontSize: 18,
      //                       color: Colors.black,
      //                   ),
      //                 ),
      //                 trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
      //                 onTap: () {
      //                   Navigator.push(context, MaterialPageRoute(builder: (context) {
      //                     return QuizInstructions(index: index+1,);
      //                   },));
      //                 },
      //               )
      //             ],
      //
      //           ),
      //         );
      //       },
      //     )
      //         :
      //     const loading(text: "Please wait...");
      //   },
      // ),
    );
  }
}
