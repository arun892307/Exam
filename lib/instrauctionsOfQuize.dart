import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'TakeQuize.dart';

class QuizInstructions extends StatelessWidget {
  const QuizInstructions({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
             Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,size: size.height*0.03),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AutoSizeText("Practice Test $index",
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.w500,
          fontSize: size.height*0.022,
          color: Colors.black
        ),),
      ),
      body: Column(
        children: [
         SizedBox(
           height: size.height*0.005,
         ),
          Row(
            children: [
              SizedBox(
                width: size.height*0.012,
              ),
               SizedBox(
                 width: size.width*0.95,
                 child: AutoSizeText("Read the instructions carefully before starting your test ---",
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontSize: size.height*0.02
              ),),
               ),
            ],
          ),
          SizedBox(
            height: size.height*0.022,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.height*0.01,
              ),
              Icon(Icons.do_not_disturb_on_total_silence,color: Colors.black,size:size.height*0.012),
              SizedBox(
                width: size.height*0.01,
              ),
              SizedBox(
                width: size.width*0.9,
                child: Text("The test contains 10 total questions.",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: size.height*0.015
                  ),
                ),
              ),

            ],
          ),
          SizedBox(
            height: size.height*0.015,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.height*0.01,
              ),
              Column(
                children: [
                  SizedBox(height: size.height*0.0045,),
                  Icon(Icons.do_not_disturb_on_total_silence,color: Colors.black,size:size.height*0.012),
                ],
              ),
              SizedBox(
                width: size.height*0.01,
              ),
              SizedBox(
                width: size.width*0.9,
                child: Text("Each question has 4 options out of which only one is correct.",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: size.height*0.015
                  ),
                ),
              ),

            ],
          ),
          SizedBox(
            height: size.height*0.015,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.height*0.01,
              ),
              Column(
                children: [
                  SizedBox(height: size.height*0.0045,),
                  Icon(Icons.do_not_disturb_on_total_silence,color: Colors.black,size:size.height*0.012),
                ],
              ),
              SizedBox(
                width: size.height*0.01,
              ),
              SizedBox(
                width: size.width*0.9,
                child: Text("You have to finish this test in total 10 minutes.",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: size.height*0.015
                  ),
                ),
              ),

            ],
          ),
          SizedBox(
            height: size.height*0.022,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.height*0.01,
              ),
              Column(
                children: [
                  SizedBox(height: size.height*0.0045,),
                  Icon(Icons.do_not_disturb_on_total_silence,color: Colors.black,size:size.height*0.012),
                ],
              ),
              SizedBox(
                width: size.height*0.01,
              ),
              SizedBox(
                width: size.width*0.9,
                child: Text("This test has Max 10 Marks.",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: size.height*0.015
                  ),
                ),
              ),

            ],
          ),
          SizedBox(
            height: size.height*0.022,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.height*0.01,
              ),
              Column(
                children: [
                  SizedBox(height: size.height*0.0045,),
                  Icon(Icons.do_not_disturb_on_total_silence,color: Colors.black,size:size.height*0.012),
                ],
              ),
              SizedBox(
                width: size.height*0.01,
              ),
              SizedBox(
                width: size.width*0.9,
                child: Text("You will be awarded 1 marks for each correct answer.",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: size.height*0.015
                  ),
                ),
              ),

            ],
          ),
          SizedBox(
            height: size.height*0.015,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.height*0.01,
              ),
              Column(
                children: [
                  SizedBox(height: size.height*0.0045,),
                  Icon(Icons.do_not_disturb_on_total_silence,color: Colors.black,size:size.height*0.012),
                ],
              ),
              SizedBox(
                width: size.height*0.01,
              ),
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: size.width*0.9,
                  child: Text("There is no negative marking for the questions that you have not attempted.",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontSize: size.height*0.015
                    ),
                  ),
                ),
              ),

            ],
          ),
          SizedBox(
            height: size.height*0.015,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.height*0.01,
              ),
              Column(
                children: [
                  SizedBox(height: size.height*0.0045,),
                  Icon(Icons.do_not_disturb_on_total_silence,color: Colors.black,size:size.height*0.012),
                ],
              ),
              SizedBox(
                width: size.height*0.01,
              ),
              SizedBox(
                width: size.width*0.9,
                child: Text("You can write this test only once.Make sure that you completed the test before you submit the test and/or close the browser",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: size.height*0.015
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height*0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width*0.22,
              ),
              Card(
                elevation: 20,
                shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Container(
                  width: size.width*0.1,
                  height: size.width*0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.green
                  ),
                  child: Center(
                    child: AutoSizeText("Q",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width*0.1,
              ),
              AutoSizeText("Answered",style: GoogleFonts.openSans(
                fontSize: size.height*0.022,
                color: Colors.black,

              ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width*0.22,
              ),
              Card(
                elevation: 20,
                shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Container(
                  width: size.width*0.1,
                  height: size.width*0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.orange

                  ),
                  child: Center(
                    child: AutoSizeText("Q",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width*0.1,
              ),
              AutoSizeText("Marked for review",style: GoogleFonts.openSans(
                fontSize: size.height*0.022,
                color: Colors.black,

              ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width*0.22,
              ),
              Card(
                elevation: 20,
                shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Container(
                  width: size.width*0.1,
                  height: size.width*0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey
                  ),
                  child: Center(
                    child: AutoSizeText("Q",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width*0.1,
              ),
              AutoSizeText("Unseen",style: GoogleFonts.openSans(
                fontSize: size.height*0.022,
                color: Colors.black,

              ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width*0.22,
              ),
              Card(
                elevation: 20,
                shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Container(
                  width: size.width*0.1,
                  height: size.width*0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.red
                  ),
                  child: Center(
                    child: AutoSizeText("Q",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width*0.1,
              ),
              AutoSizeText("Unattempted",style: GoogleFonts.openSans(
                fontSize: size.height*0.022,
                color: Colors.black,

              ),)
            ],
          ),
          const Expanded(child: SizedBox()),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.height*0.01,
              ),
              Column(
                children: [
                  SizedBox(height: size.height*0.0045,),
                  Icon(Icons.do_not_disturb_on_total_silence,color: Colors.black,size:size.height*0.012),
                ],
              ),
              SizedBox(
                width: size.height*0.01,
              ),
              SizedBox(
                width: size.width*0.9,
                child: Text("I have read all the instructions carefully and have understood them.",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: size.height*0.015
                  ),
                ),
              ),

            ],
          ),
          SizedBox(
            height: size.height*0.1,
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () async {
          await FlutterWindowManager.addFlags(
              FlutterWindowManager.FLAG_SECURE).whenComplete(() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return QuizScreen(notesId: 1,);
            },));
          });

        },
        child: Container(
          height: size.height*0.061,
          width: size.width*0.93,
          decoration:BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                  color: Colors.black,
                  width: 2
              ),
              borderRadius: BorderRadius.all(Radius.circular(size.height*0.008)),
          ),
          child: Center(
            child: AutoSizeText(
              "Agree and Continue",
              style: GoogleFonts.openSans(
                  fontSize: size.height*0.017,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
      ),
    );
  }
}
