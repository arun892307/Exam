import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_upi_pay/Src/payment.dart';
import 'package:google_fonts/google_fonts.dart';

import 'content_page.dart';

class PracticePapers extends StatefulWidget {
  const PracticePapers({Key? key}) : super(key: key);
  @override
  State<PracticePapers> createState() => _PracticePapersState();
}

class _PracticePapersState extends State<PracticePapers> {

  final TextEditingController question=TextEditingController();
  final TextEditingController name=TextEditingController();
  FlutterPayment flutterPayment = FlutterPayment();
  Color textColor = Colors.white;
  List<String> sectionTwoParts = [
    "Schedule of power",
    "Basic knowledge about DMRC Projects, Consultancy, Property Business,Property Development and O&M, including O&M Statistics",
    "The Various Policies of DMRC",
    "The Right to Information Act, 2005",
    "THE DELHI METRO RAILWAY (O&M) ACT, 2002 - AS AMENDED FROM TIME TO TIME",
    "Code on Wages, 2019, The Occupational Safety, Health and Working Conditions Code, 2020, and The Code on Social Security, 2020",
    "Social Security, Staff Welfare Schemes, and various related benefits to Employees in DMRC",
    "Multi-Purpose Advance",
    "Social Welfare – GRATUITY, PF, PENSION",
    "HOUSE BUILDING ADVANCE",
    "Corporate Social Responsibility",
    "Conduct, Discipline and Appeal Rules, Rules of Positive Discipline, Code of Ethics and Rules regarding Zero Tolerance towards Corruption",
    "VISION, MISSION & CULTURE",
    "BUDGET",
    "TENDER",
    "Official language"
  ];
  List<String> sectionTwoIcons = [
    "save-energy.png",
    "knowledge.png",
    "policy.png",
    "women-rights.png",
    "amendment.png",
    "password.png",
    "account.png",
    "pie-chart.png",
    "retirement.png",
    "alone.png",
    "accountability.png",
    "work.png",
    "united.png",
    "budget.png",
    "auction.png",
    "languages.png"
  ];
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
              child: AutoSizeText("Paper-I: Technical Paper",style: GoogleFonts.openSans(color: textColor,fontWeight: FontWeight.w600,fontSize: size.width*0.05),),
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
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {

                          return const ContentPage();
                        },));
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width*0.15,
                            child: Image.asset("assets/images/electrical-engineer.png"),
                          ),
                          SizedBox(height: size.height*0.01,),
                          AutoSizeText(
                            "Electrical\nEngineer",
                            style: GoogleFonts.openSans(color: textColor,fontWeight: FontWeight.w600,fontSize: size.width*0.035),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width*0.15,
                          child: Image.asset("assets/images/it-department.png"),
                        ),
                        SizedBox(height: size.height*0.01,),
                        AutoSizeText(
                          "S&T and IT",
                          style: GoogleFonts.openSans(
                              color: textColor,
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
                              color: textColor,
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
                            color: textColor,
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
                            color: textColor,
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
                            color: textColor,
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
                          child: Image.asset("assets/images/civil-engineering.png"),
                        ),
                        SizedBox(height: size.height*0.01,),
                        AutoSizeText("Civil\nEngineer",
                          style: GoogleFonts.openSans(
                            color: textColor,
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
                            color: textColor,
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
                            color: textColor,
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
            SizedBox(
              height: size.height*0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: AutoSizeText("Paper-II: General Policy & Rules",style: GoogleFonts.openSans(color: textColor,fontWeight: FontWeight.w600,fontSize: size.width*0.05),),
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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10
                ),
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sectionTwoParts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        width: size.width*0.15,
                        child: Image.asset("assets/images/${sectionTwoIcons[index]}"),
                      ),
                      SizedBox(height: size.height*0.01,),
                      AutoSizeText(
                        sectionTwoParts[index],
                        style: GoogleFonts.openSans(color: textColor,fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        minFontSize: 13,
                        maxFontSize: 13,
                      )
                    ],
                  );
                },
              ),
            ),
            Card(
              child: TextField(
                maxLines: 1,
                controller: question,
                decoration: const InputDecoration(
                  hintText: "UPI Id",
                ),
              ),
            ),
            Card(
              child: TextField(
                maxLines: 1,
                controller: name,
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
              ),
            ),
            ListTile(
              title: AutoSizeText(
                "Payment",
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  color: textColor,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
              onTap: () async {
                try{
                  flutterPayment.launchUpi(
                      upiId: question.text.trim(),
                      name: name.text.trim(),
                      amount: "1",
                      message: "test",
                      currency: "INR");
                } catch (e) {
                  print(e);
                }
                // try{final res = await EasyUpiPaymentPlatform.instance.startPayment(
                //   EasyUpiPaymentModel(
                //     payeeVpa: question.text.trim(),
                //     payeeName: name.text.trim(),
                //     amount: 1.0,
                //     description: 'Testing payment',
                //
                //   ),
                // ).then((value) async {
                //   await FirebaseFirestore.instance.collection("User Details").doc(usermodel["Email"]).update({
                //     "then":{value?.amount,value?.approvalRefNo,value?.transactionId,value.toString()},
                //   });
                // }).onError((error, stackTrace) async {
                //   await FirebaseFirestore.instance.collection("User Details").doc(usermodel["Email"]).update({
                //     "On Error":{error.toString()},
                //   });
                // });
                // // TODO: add your success logic here
                // print(res);
                // await FirebaseFirestore.instance.collection("User Details").doc(usermodel["Email"]).update({
                //   "Res":res,
                // });
                // }on EasyUpiPaymentException catch(e){
                //   await FirebaseFirestore.instance.collection("User Details").doc(usermodel["Email"]).update({
                //     "Error": {e.message,e.details,e.stacktrace,e.type},
                //   });
                // }
              },
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
