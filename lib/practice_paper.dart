import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return SingleChildScrollView(
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: AutoSizeText("Paper-I: Technical Paper",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: size.width*0.05),),
            ),
            Card(
              color: Colors.white24,
              elevation: 30,
              shadowColor: Colors.white10,
              shape: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black
                )
              ),
              child: Padding(
                padding: EdgeInsets.only(top: size.height*0.025),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: size.width*0.15,
                          child: Image.asset("assets/images/electrical-engineer.png"),
                        ),
                        SizedBox(height: size.height*0.01,),
                        AutoSizeText(
                          "Electrical\nEngineer",
                          style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: size.width*0.035),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width*0.15,
                          child: Image.asset("assets/images/electrical-engineer.png"),
                        ),
                        SizedBox(height: size.height*0.01,),
                        AutoSizeText(
                          "S&T and IT",
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: size.width*0.035,
                          ),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width*0.15,
                          child: Image.asset("assets/images/operations.png"),
                        ),
                        SizedBox(height: size.height*0.01,),
                        AutoSizeText(
                          "Operations",
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: size.width*0.035,
                          ),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width*0.15,
                          child: Image.asset("assets/images/financial.png"),
                        ),
                        SizedBox(height: size.height*0.01,),
                        AutoSizeText(
                          "Finance",
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: size.width*0.035,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width*0.15,
                          child: Image.asset("assets/images/human-resource.png"),
                        ),
                        SizedBox(height: size.height*0.01,),
                        AutoSizeText(
                          "Human Resource",
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: size.width*0.035,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width*0.15,
                          child: Image.asset("assets/images/store.png"),
                        ),
                        SizedBox(height: size.height*0.01,),
                        AutoSizeText("Stores",
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: size.width*0.035,
                          ),
                          textAlign: TextAlign.center,),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width*0.15,
                          child: Image.asset("assets/images/electrical-engineer.png"),
                        ),
                        SizedBox(height: size.height*0.01,),
                        AutoSizeText("Civil\nEngineer",
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: size.width*0.035,
                          ),
                          textAlign: TextAlign.center,),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width*0.15,
                          child: Image.asset("assets/images/architect.png"),
                        ),
                        SizedBox(height: size.height*0.01,),
                        AutoSizeText("Architect\nEngineer",
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: size.width*0.035,
                          ),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width*0.15,
                          child: Image.asset("assets/images/protection.png"),
                        ),
                        SizedBox(height: size.height*0.01,),
                        AutoSizeText("Security",
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: size.width*0.035,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: AutoSizeText("Paper-II: General Policy & Rules",style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: size.width*0.05),),
            ),
            SizedBox(height: size.height*0.03,),
            GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: size.width*0.15,
                      child: Image.asset("assets/images/electrical-engineer.png"),
                    ),
                    SizedBox(height: size.height*0.01,),
                    AutoSizeText(
                      "Electrical\nEngineer",
                      style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w600,fontSize: size.width*0.035),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: size.width*0.15,
                      child: Image.asset("assets/images/electrical-engineer.png"),
                    ),
                    SizedBox(height: size.height*0.01,),
                    AutoSizeText(
                      "S&T and IT",
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width*0.035,
                      ),
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: size.width*0.15,
                      child: Image.asset("assets/images/operations.png"),
                    ),
                    SizedBox(height: size.height*0.01,),
                    AutoSizeText(
                      "Operations",
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width*0.035,
                      ),
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: size.width*0.15,
                      child: Image.asset("assets/images/financial.png"),
                    ),
                    SizedBox(height: size.height*0.01,),
                    AutoSizeText(
                      "Finance",
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width*0.035,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: size.width*0.15,
                      child: Image.asset("assets/images/human-resource.png"),
                    ),
                    SizedBox(height: size.height*0.01,),
                    AutoSizeText(
                      "Human Resource",
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width*0.035,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: size.width*0.15,
                      child: Image.asset("assets/images/store.png"),
                    ),
                    SizedBox(height: size.height*0.01,),
                    AutoSizeText("Stores",
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width*0.035,
                      ),
                      textAlign: TextAlign.center,),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: size.width*0.15,
                      child: Image.asset("assets/images/electrical-engineer.png"),
                    ),
                    SizedBox(height: size.height*0.01,),
                    AutoSizeText("Civil\nEngineer",
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width*0.035,
                      ),
                      textAlign: TextAlign.center,),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: size.width*0.15,
                      child: Image.asset("assets/images/architect.png"),
                    ),
                    SizedBox(height: size.height*0.01,),
                    AutoSizeText("Architect\nEngineer",
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width*0.035,
                      ),
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: size.width*0.15,
                      child: Image.asset("assets/images/protection.png"),
                    ),
                    SizedBox(height: size.height*0.01,),
                    AutoSizeText("Security",
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width*0.035,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ],
        )

    //     ListTile(
    //     title: AutoSizeText(
    //     "Payment",
    //     style: GoogleFonts.openSans(
    //       fontSize: 18,
    //       color: Colors.black,
    //     ),
    //   ),
    //   trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
    //   onTap: () async {
    //     try{final res = await EasyUpiPaymentPlatform.instance.startPayment(
    //       EasyUpiPaymentModel(
    //         payeeVpa: question.text.trim(),
    //         payeeName: name.text.trim(),
    //         amount: 1.0,
    //         description: 'Testing payment',
    //       ),
    //     ).then((value) async {
    //       await FirebaseFirestore.instance.collection("User Details").doc(usermodel["Email"]).update({
    //         "then":{value?.amount,value?.approvalRefNo,value?.transactionId,value.toString()},
    //       });
    //     }).onError((error, stackTrace) async {
    //       await FirebaseFirestore.instance.collection("User Details").doc(usermodel["Email"]).update({
    //         "On Error":{error.toString()},
    //       });
    //     });
    //     // TODO: add your success logic here
    //     print(res);
    //     await FirebaseFirestore.instance.collection("User Details").doc(usermodel["Email"]).update({
    //       "Res":res,
    //     });
    //     }on EasyUpiPaymentException catch(e){
    //       await FirebaseFirestore.instance.collection("User Details").doc(usermodel["Email"]).update({
    //         "Error": {e.message,e.details,e.stacktrace,e.type},
    //       });
    //     }
    //   },
    // ),

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
      ),
    );
  }
}
