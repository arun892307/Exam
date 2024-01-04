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

  late List<int> questionStatus ;
  List<dynamic>options=[];
  List<dynamic>optionsH=[];
  dynamic selectedOption = "";
  late int optionIndex=0;
  var currentChoice = '';
  late DocumentSnapshot<Map<String, dynamic>> snap;
  PageController pageQuestionController = PageController();
  bool loaded = false;
  bool skip=false;
  String language = "English";

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
    return loaded
          ?
    WillPopScope(
        onWillPop: (){
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                  child:Container(
                    height: size.height*0.25,
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
                          padding:  EdgeInsets.only(left:size.width*0.03, right:size.width*0.03),
                          child: AutoSizeText(
                            "If you exit from this page your response will not be submit.",
                            style: GoogleFonts.openSans(
                                color: Colors.white70,
                                fontSize: size.height*0.022
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.028,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: size.height*0.05,
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
                                child:Text("No",style: GoogleFonts.openSans(fontSize: size.width*0.035,color: Colors.black,fontWeight: FontWeight.w500),),


                              ),
                            ),
                            Container(
                              height: size.height*0.05,
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
                                child:Text("Yes",style: GoogleFonts.openSans(fontSize: size.width*0.035,color: Colors.black,fontWeight: FontWeight.w500),),


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
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                              child:Container(
                                height: size.height*0.25,
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
                                      padding:  EdgeInsets.only(left:size.width*0.03, right:size.width*0.03),
                                      child: AutoSizeText(
                                        "If you exit from this page your response will not be submit.",
                                        style: GoogleFonts.openSans(
                                            color: Colors.white70,
                                            fontSize: size.height*0.022
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height*0.028,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: size.height*0.05,
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
                                            child:Text("No",style: GoogleFonts.openSans(fontSize: size.width*0.035,color: Colors.black,fontWeight: FontWeight.w500),),


                                          ),
                                        ),
                                        Container(
                                          height: size.height*0.05,
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
                                            child:Text("Yes",style: GoogleFonts.openSans(fontSize: size.width*0.035,color: Colors.black,fontWeight: FontWeight.w500),),


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
                  DropdownMenu(
                    onSelected: (value) {
                        setState(() {
                          language = value!;
                        });
                      },
                    textStyle: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 16,

                    ),
                    dropdownMenuEntries: const [
                        DropdownMenuEntry(
                          value: "Hindi",
                          label: "Hindi",
                        ),
                        DropdownMenuEntry(
                            value: "English",
                            label: "English"
                        ),
                      ],
                    helperText: "English",
                    initialSelection: "English",
                  ),
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                ],
              ),
              endDrawer: Drawer(
                elevation: 30,
                child: Column(
                  children: [
                    SizedBox(height: size.height*0.045,),
                    AutoSizeText("Questions Status",
                      style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                        padding: const EdgeInsets.all(10),
                        itemCount: snap.data()?["Questions"].length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              setState(() {
                                int curr= count;
                                count=index;
                                pageQuestionController.animateToPage(count,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.linear);
                                selectedOption="";
                                if(questionStatus[curr] == 0){
                                  questionStatus[curr] = 2;
                                }
                              });
                              Scaffold.of(context).closeEndDrawer();
                            },
                            child: Card(
                              elevation: 20,
                              shape: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black,width: 1.5),
                                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                                  color: questionStatus[index]==1 ?Colors.green : questionStatus[index]==0 ? Colors.grey : questionStatus[index]==2 ? Colors.red :Colors.orangeAccent,
                                ),
                                child: Center(
                                  child: AutoSizeText("${index+1}",
                                    style: GoogleFonts.openSans(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },)
                  ],
                ),
              ),
              body: Column(
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
                      itemBuilder: (context, index2,) {
                        return Padding(
                          padding: EdgeInsets.all(size.width * 0.005),
                          child: SizedBox(
                            width: (size.width * 0.9 - (size.width * 0.01 * (snap.data()?["Questions"].length - 1))) / snap.data()?["Questions"].length,
                            child: Divider(
                              color: (count) > index2
                                  ?
                              Colors.green
                                  :
                              (count) ==index2
                                  ?
                              Colors.red
                                  :
                              Colors.white70,

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
                        optionsH.clear();
                        options=snap.data()?["Questions"][index]["Options"];
                        optionsH=snap.data()?["Questions"][index]["OptionsH"] ?? [];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.02),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Padding(
                                  padding: EdgeInsets.all(size.width * 0.04),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: size.width * 1,
                                        child: AutoSizeText(
                                          "${index + 1}. ${language=="English" ? snap.data()!["Questions"][index]["Question"] : snap.data()!["Questions"][index]["QuestionH"]}",
                                          style: GoogleFonts.poppins(
                                            fontSize: size.width * 0.06,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.03,
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
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
                                                      "${language == "English" ? options[index1] : optionsH[index1]}",
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
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      loaded && count>0
                          ?
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)),side: BorderSide(color: Colors.white,width: 1.5))
                        ),
                          onPressed: (){
                            print(usermodel["Email"]);
                            setState(() {
                              count>0?count--:null;
                              pageQuestionController.animateToPage(count,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.linear);
                              selectedOption="";
                              if(questionStatus[count+1] == 0){
                                questionStatus[count+1] = 2;
                              }
                            });

                          },
                          child: AutoSizeText("Previous",style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 16
                          ),)
                      )
                          :
                      SizedBox(
                        width: size.width*0.225
                      ),
                      loaded && (count< snap.data()?["Questions"].length-1)
                          ?
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)),side: BorderSide(color: Colors.white,width: 1.5))
                          ),
                          onPressed: (){
                            print(usermodel["Email"]);
                            setState(() {

                                count<snap.data()?["Questions"].length-1?count++:null;
                                pageQuestionController.animateToPage(count,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.linear);
                                selectedOption="";
                                questionStatus[count-1] = 3;
                            });

                          },
                          child: AutoSizeText("Mark for review",
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 16
                          ),)
                      )
                      :
                      const SizedBox(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)),side: BorderSide(color: Colors.black,width: 2))
                          ),
                          onPressed: loaded && (count< snap.data()?["Questions"].length-1)
                              ?
                              (){
                            print(usermodel["Email"]);
                              if(selectedOption != "")
                              {
                                setState(() {
                                if(snap.data()?["Questions"][count + 1]["Correct option"]==selectedOption)
                                {
                                  score+=1;
                                }
                                count<snap.data()?["Questions"].length-1?count++:null;
                                pageQuestionController.animateToPage(count,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.linear);
                                selectedOption="";
                                questionStatus[count-1] = 1;
                              });
                              }
                              else{
                               setState(() {
                                 count<snap.data()?["Questions"].length-1?count++:null;
                                 pageQuestionController.animateToPage(count,
                                     duration: const Duration(milliseconds: 100),
                                     curve: Curves.linear);
                                 selectedOption="";
                                 questionStatus[count-1] = 2;
                               });
                              }



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
                          child: AutoSizeText(
                              loaded && (count< snap.data()?["Questions"].length-1 )
                                  ?
                              "Save & Next"
                                  :
                              "Submit",
                            style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontSize: 16
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height*0.01,
                  )
                ],
              )

            )
        )
    )
        :
    const SizedBox(
      child: loading(
        text: 'Please wait Quiz is Fetching from Server',
      ),
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
    }).whenComplete(() async {
      setState(() {
        questionStatus = List.filled(snap.data()!["Questions"].length, 0);
        loaded = true;
      });
    });
  }
}

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
