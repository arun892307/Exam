import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'TakeQuize.dart';

class QuizInstructions extends StatelessWidget {
  const QuizInstructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
             Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.white,size: size.height*0.03),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AutoSizeText("Practice Test 1",
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.w600,
          fontSize: size.height*0.022,
          color: Colors.white
        ),),
      ),
      body: Container(
        child: Column(
          children: [
           SizedBox(
             height: size.height*0.022,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.height*0.01,
                ),
                Icon(Icons.do_not_disturb_on_total_silence,color: Colors.white,size:size.height*0.012),
                SizedBox(
                  width: size.height*0.01,
                ),
                SizedBox(
                  width: size.width*0.9,
                  child: Text("The test conrtains 10 total questions.",
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
                Icon(Icons.do_not_disturb_on_total_silence,color: Colors.white,size:size.height*0.012),
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
                Icon(Icons.do_not_disturb_on_total_silence,color: Colors.white,size:size.height*0.012),
                SizedBox(
                  width: size.height*0.01,
                ),
                SizedBox(
                  width: size.width*0.9,
                  child: Text("You have finish this test in total 10 minuets.",
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
                Icon(Icons.do_not_disturb_on_total_silence,color: Colors.white,size:size.height*0.012),
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
                Icon(Icons.do_not_disturb_on_total_silence,color: Colors.white,size:size.height*0.012),
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

            SizedBox(
              height: size.height*0.022,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.height*0.01,
                ),
                Icon(Icons.do_not_disturb_on_total_silence,color: Colors.white,size:size.height*0.012),
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
                Icon(Icons.do_not_disturb_on_total_silence,color: Colors.white,size:size.height*0.012),
                SizedBox(
                  width: size.height*0.01,
                ),
                SizedBox(
                  width: size.width*0.9,
                  child: Text("In question status the following colours : Grey,Green,Red,Deep orange represent unseen, Answered, Unattempted, Marked For Review respectively.",
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
                Icon(Icons.do_not_disturb_on_total_silence,color: Colors.white,size:size.height*0.012),
                SizedBox(
                  width: size.height*0.01,
                ),
                SizedBox(
                  width: size.width*0.9,
                  child: Text("You can write this test only once.Make sure hat you completed the test before you submit the test and/or close the browser",
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
                Icon(Icons.do_not_disturb_on_total_silence,color: Colors.white,size:size.height*0.012),
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
            )
          ],
        ),
      ),
      floatingActionButton:  InkWell(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return QuizScreen(notesId: 1,);
          },));
        },
        child: Container(
          height: size.height*0.061,
          width: size.width*0.93,
          decoration:BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                  color: Colors.blue,
                  width: 2
              ),
              borderRadius: BorderRadius.all(Radius.circular(size.height*0.008))
          ),
          child: Center(
            child: AutoSizeText(
              "Agree and Continue",
              style: GoogleFonts.openSans(
                  fontSize: size.height*0.017,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
      ),
    );
  }
}
