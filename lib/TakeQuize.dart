import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'Constraints.dart';
import 'loadingscreen.dart';



late Timer _timer;
int _start = 0;
int minute=0;
int milliSecond=0;
var count = 0;
var totalMinutes;
int score=0;
Map<String,dynamic>responseMap={};

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key,
    required this.notesId});
  int notesId;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with WidgetsBindingObserver{

  //List<String> selectedChoice = [];
  List<dynamic>options=[];
  dynamic selectedOption = "";
  late int optionIndex=0;
  var CurrentChoice = '';
  late DocumentSnapshot<Map<String, dynamic>> snap;
  PageController pageQuestionController = PageController();
  bool loaded = false;
  bool skip=false;


  @override
  initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    fetchQuiz();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    try {
      //super.didChangeAppLifecycleState(state);
      switch (state) {
        case AppLifecycleState.resumed:
          setState(() {
            if(skip && count<=snap.data()?["Questions"].length -1){
              int page=count;
              pageQuestionController.animateToPage(page+1, duration: const Duration(milliseconds: 200), curve: Curves.linear);
              count=page+1;
              if(loaded &&  count==snap.data()?["Questions"].length){
                submit(context,widget.notesId);
              }
            }
            skip=true;
          });
          break;
        case AppLifecycleState.inactive:

          break;
        case AppLifecycleState.paused:

          break;
        case AppLifecycleState.detached:

          break;
        default:
          break;
      /* case AppLifecycleState.hidden:*/
      // TODO: Handle this case.
      }
    } catch (e) {
      if (kDebugMode) {
        print('inside observer in quizscreen catch statement');
      }
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: (){
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                  child:Container
                    (
                    height: size.height*0.26,
                    width: size.width*0.732,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(size.height*0.02)),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        gradient: const LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.black54,
                              Colors.black
                            ]
                        )
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height*0.02,
                        ),
                        AutoSizeText(
                          "Do You want to Exit?",
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: size.height*0.022
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.022,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left:size.width*0.1, right:size.width*0.01),
                          child: AutoSizeText(
                            "If you exit from this page your response will not be submit.",
                            style: GoogleFonts.openSans(
                                color: Colors.white70,
                                fontSize: size.height*0.022
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.028,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: size.height*0.038,
                              width: size.width*0.15,
                              decoration:  BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.blue, Colors.purpleAccent],
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                              ),
                              child: ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    Navigator.pop(context);
                                  });

                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(size.width*0.02),
                                  ),
                                ),
                                child:Text("No",style: GoogleFonts.exo(fontSize: size.width*0.032,color: Colors.black,fontWeight: FontWeight.w400),),


                              ),
                            ),
                            Container(
                              height: size.height*0.038,
                              width: size.width*0.15,
                              decoration:  BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.blue, Colors.purpleAccent],
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                              ),
                              child: ElevatedButton(
                                onPressed: (){
                                  _start = 0;
                                  minute=0;
                                  milliSecond=0;
                                  count = 0;
                                  totalMinutes;
                                  score=0;
                                  _timer.cancel();
                                  Navigator.pop(context);
                                  Navigator.pop(context);

                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(size.width*0.02),
                                  ),
                                ),
                                child:Text("Yes",style: GoogleFonts.exo(fontSize: size.width*0.032,color: Colors.black,fontWeight: FontWeight.w400),),


                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
              );
            },
          );
          return Future.value(true);
        },
        child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(17, 22, 44, 1),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: false,
              appBar: AppBar(
                titleSpacing: 0,
                leading: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                              child:Container
                                (
                                height: size.height*0.22,
                                width: size.width*0.72,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(size.height*0.02)),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.black,
                                          Colors.black54,
                                          Colors.black
                                        ]
                                    )
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height*0.02,
                                    ),
                                    AutoSizeText(
                                      "Do You want to Exit?",
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: size.height*0.022
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height*0.022,
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left:size.width*0.1, right:size.width*0.01),
                                      child: AutoSizeText(
                                        "If you exit from this page your response will not be submit.",
                                        style: GoogleFonts.openSans(
                                            color: Colors.white70,
                                            fontSize: size.height*0.022
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height*0.028,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: size.height*0.038,
                                          width: size.width*0.15,
                                          decoration:  BoxDecoration(
                                            gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [Colors.blue, Colors.purpleAccent],
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: (){
                                              setState(() {
                                                Navigator.pop(context);
                                              });

                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.transparent,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(size.width*0.02),
                                              ),
                                            ),
                                            child:Text("No",style: GoogleFonts.exo(fontSize: size.width*0.032,color: Colors.black,fontWeight: FontWeight.w400),),


                                          ),
                                        ),
                                        Container(
                                          height: size.height*0.038,
                                          width: size.width*0.15,
                                          decoration:  BoxDecoration(
                                            gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [Colors.blue, Colors.purpleAccent],
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: (){
                                              _start = 0;
                                              minute=0;
                                              milliSecond=0;
                                              count = 0;
                                              totalMinutes;
                                              score=0;
                                              // Navigator.pop(context);
                                              _timer.cancel();
                                              Navigator.pop(context);
                                              Navigator.pop(context);


                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.transparent,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(size.width*0.02),
                                              ),
                                            ),
                                            child:Text("Yes",style: GoogleFonts.exo(fontSize: size.width*0.032,color: Colors.black,fontWeight: FontWeight.w400),),


                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white70,
                    )),
                title: AutoSizeText(
                  'Practice Test ${widget.notesId}',
                  style: GoogleFonts.poppins(
                      fontSize: size.width * 0.055,
                      color: Colors.white70,
                      fontWeight: FontWeight.w600),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Padding(
                    padding:  EdgeInsets.all(size.height*0.012),
                    child: Container(
                      height: size.height*0.01,
                      width: size.width*0.24,
                      decoration:  BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue, Colors.purpleAccent],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(size.height*0.016),
                        ),),
                      child: ElevatedButton(
                        onPressed: (){

                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                  child:Container
                                    (
                                    height: size.height*0.22,
                                    width: size.width*0.72,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(size.height*0.02)),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.black,
                                              Colors.black54,
                                              Colors.black
                                            ]
                                        )
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: size.height*0.02,
                                        ),
                                        AutoSizeText(
                                          "Do You want to Exit?",
                                          style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              fontSize: size.height*0.022
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height*0.022,
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(left:size.width*0.1, right:size.width*0.01),
                                          child: AutoSizeText(
                                            "If you exit from this page your response will not be submit.",
                                            style: GoogleFonts.openSans(
                                                color: Colors.white70,
                                                fontSize: size.height*0.022
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height*0.028,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: size.height*0.038,
                                              width: size.width*0.15,
                                              decoration:  BoxDecoration(
                                                gradient: const LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [Colors.blue, Colors.purpleAccent],
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                                              ),
                                              child: ElevatedButton(
                                                onPressed: (){
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });

                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.transparent,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(size.width*0.02),
                                                  ),
                                                ),
                                                child:Text("No",style: GoogleFonts.exo(fontSize: size.width*0.032,color: Colors.black,fontWeight: FontWeight.w400),),


                                              ),
                                            ),
                                            Container(
                                              height: size.height*0.038,
                                              width: size.width*0.15,
                                              decoration:  BoxDecoration(
                                                gradient: const LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [Colors.blue, Colors.purpleAccent],
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                                              ),
                                              child: ElevatedButton(
                                                onPressed: (){
                                                  _start = 0;
                                                  minute=0;
                                                  milliSecond=0;
                                                  count = 0;
                                                  totalMinutes;
                                                  score=0;
                                                  _timer.cancel();
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);


                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.transparent,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(size.width*0.02),
                                                  ),
                                                ),
                                                child:Text("Yes",style: GoogleFonts.exo(fontSize: size.width*0.032,color: Colors.black,fontWeight: FontWeight.w400),),


                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                              );
                            },
                          );

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child:Text("Quit Quiz",style: GoogleFonts.exo(fontSize: size.width*0.035,color: Colors.white),),


                      ),
                    ),
                  )
                ],
              ),
              body:
              loaded
                  ?
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: Row(
                      children: [
                        Text(
                          'Question ${count+1}',
                          style: TextStyle(
                              fontSize: size.width * 0.1,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70),
                        ),
                        Text(
                          '/${snap.data()?["Questions"].length}',
                          style: TextStyle(
                              fontSize: size.width * 0.07,
                              fontWeight: FontWeight.w600,
                              color: Colors.white60),
                        ),
                        SizedBox(
                          width: size.width*0.16,
                        ),
                        time(notesId:widget.notesId)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                    width: size.width * 0.90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snap.data()?["Questions"].length,
                      itemBuilder: (
                          context,
                          index2,
                          ) {
                        return Padding(
                          padding: EdgeInsets.all(size.width * 0.005),
                          child: SizedBox(
                            width: (size.width * 0.9 -
                                (size.width *
                                    0.01 *
                                    (snap.data()?["Questions"].length - 1))) / snap.data()?["Questions"].length,
                            child: Divider(
                              color: (count) > index2
                                  ? Colors.green
                                  : (count) ==index2
                                  ? Colors.red
                                  : Colors.white70,
                              thickness: size.height * 0.005,
                              height: size.height * 0.005,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: pageQuestionController,
                      itemCount: snap.data()?["Questions"].length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        count=index;
                        options.clear();
                        options=snap.data()?["Questions"][index]["Options"];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.02),
                            SizedBox(
                              height: size.height * 0.78,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Padding(
                                    padding: EdgeInsets.all(size.width * 0.04),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: size.width * 1,
                                          child: AutoSizeText(
                                            "${index + 1}. ${snap.data()?["Questions"][index]["Question"]}",
                                            style: GoogleFonts.poppins(
                                              fontSize: size.width * 0.06,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.03,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.081*snap.data()?["Questions"][index]["Options"].length,
                                          //size.height*0.081 * snapshot.data()?["Feedback Questions"][index1]['Options'].length,
                                          child: ListView.builder(
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: snap.data()?["Questions"][index]["Options"].length,
                                            itemBuilder: (context, index1) {

                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: size.height * 0.008,
                                                    horizontal: size.width * 0.01),
                                                child: Row(
                                                  children: [
                                                    AutoSizeText(
                                                      "${index1+1}",
                                                      style: GoogleFonts.poppins(
                                                        fontSize: 18,
                                                        color: options[index1]==selectedOption?Colors.green:Colors.white70,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: size.width*0.03,
                                                    ),
                                                    Container(
                                                      width: size.width * 0.8,
                                                      height: size.height * 0.065,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            size.width * 0.02),
                                                        border: Border.all(
                                                          color: options[index1]==selectedOption?Colors.green:Colors.white70,
                                                          //options[index]==currentChoice[index1]?Colors.green:Colors.white70,
                                                        ),
                                                      ),
                                                      child: ListTile(
                                                        title: AutoSizeText(
                                                          "${options[index1]}",
                                                          style: GoogleFonts.poppins(
                                                            color: options[index1]==selectedOption?Colors.green:Colors.white70,
                                                          ),
                                                        ),
                                                        trailing: Radio(
                                                          value: options[index1],
                                                          fillColor: MaterialStateColor
                                                              .resolveWith(
                                                                (states) => options[index1]==selectedOption?Colors.green:Colors.white70,
                                                          ),
                                                          groupValue: selectedOption,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              optionIndex=index1;
                                                              selectedOption = value;
                                                            });
                                                          },
                                                        ),
                                                        onTap: () {
                                                          setState(() {
                                                            optionIndex=index1;
                                                            selectedOption = options[index1];
                                                          });
                                                          print(selectedOption);
                                                          print(options);

                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              )
                  :
              const SizedBox(
                child: loading(
                  text: 'Please wait Quiz is Fetching from Server',
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: loaded && (count< snap.data()?["Questions"].length-1)
                    ?
                    (){
                      print(usermodel["Email"]);
                  setState(() {
                    if(selectedOption != "")
                    {
                      if(snap.data()?["Questions"][count + 1]["Correct option"]==selectedOption)
                      {
                        score+=1;
                      }
                      count<snap.data()?["Questions"].length-1?count++:null;
                      pageQuestionController.animateToPage(count,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.linear);
                    }
                    selectedOption="";
                  });

                }
                    :
                    () async {

                  if(selectedOption!="")
                  {
                    totalMinutes=minute+(_start/60)+((milliSecond/1000)/60);
                    if(snap.data()?["Questions"][count]["Correct option"]==selectedOption)
                    {
                      score+=1;
                    }
                    print("Score is:$score");
                    Navigator.push(context,
                      PageTransition(
                          child: const loading(text: "Data is uploading to the server Please wait."),
                          type: PageTransitionType.bottomToTopJoined,
                          childCurrent:  QuizScreen(notesId: widget.notesId),
                          duration: const Duration(milliseconds: 200)
                      ),
                    );
                    print(usermodel["Email"]);
                    await FirebaseFirestore.instance
                        .collection("User Details")
                        .doc("${usermodel["Email"]}")
                        .update({
                      "Practice Test ${widget.notesId} Score" : score
                    }).whenComplete(() {
                      print(".......................Ho gaya upload");

                      //super.dispose();
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });

                  }
                  _timer.cancel();
                },
                backgroundColor: Colors.transparent,
                elevation: 25,
                shape: const StadiumBorder(),
                isExtended: true,
                heroTag: "dg",
                label: Text(loaded && (count< snap.data()?["Questions"].length-1)
                    ?"Next" : "Submit"),

              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            )
        )
    );
  }

fetchQuiz() async {
    await FirebaseFirestore.instance
        .collection("Test")
        .doc("Practice Test ${widget.notesId}")
        .get()
        .then((value) {
      snap = value;
      print("$value");
    }).whenComplete(() {
      setState(() {
        //selectedChoice=List.generate(snap.data()?["Questions"].length, (index) =>"");
        loaded = true;
      });
    });
  }



}
//  ${usermodel["University"].toString().split(" ")[0]} ${usermodel["College"].toString().split(" ")[0]} ${usermodel["Course"].toString().split(" ")[0]} ${usermodel["Branch"].toString().split(" ")[0]} ${usermodel["Year"].toString().split(" ")[0]} ${usermodel["Section"].toString().split(" ")[0]}

class time extends StatefulWidget {
  time({super.key,
    required this.notesId});
  int notesId;
  @override
  State<time> createState() => _timeState();
}

class _timeState extends State<time> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AutoSizeText("$minute : $_start",
      style: GoogleFonts.poppins(
          color: Colors.redAccent,
          fontSize: size.height*0.04
      ),);
  }
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) async {
        if (_start == 60) {
          setState(() {
            minute++;
            _start=0;
          });
          //timer.cancel();
        }
       /* else if(milliSecond==1000)
        {

          if(mounted)
          {
            setState(() {
              _start++;
              milliSecond=0;
            });
            }
          }*/



        else{

          setState(() {
            _start++;
          });
        }
        if(minute==5)
        {
          submit(context, widget.notesId);
        }
      },
    );
  }
}

submit(BuildContext context,int notesId) async {
  _timer.cancel();
  //super.dispose();
  Navigator.push(context,
    PageTransition(
        child: const loading(text: "Data is uploading to the server Please wait."),
        type: PageTransitionType.bottomToTopJoined,
        childCurrent:  QuizScreen(notesId: notesId),
        duration: const Duration(milliseconds: 200)
    ),
  );
  await FirebaseFirestore.instance
      .collection("User Details")
      .doc("${usermodel["Email"]}")
      .update({

  }).whenComplete(() {
    _start = 0;
    minute=0;
    milliSecond=0;
    count = 0;
    totalMinutes;
    score=0;
    print(".......................Ho gaya upload");
    Navigator.pop(context);

  });
}
