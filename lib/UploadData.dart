import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_ptalform/loadingscreen.dart';
import 'package:translator/translator.dart';

class UploadData extends StatefulWidget {
  const UploadData({super.key});

  @override
  State<UploadData> createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadData> {
  TextEditingController question = TextEditingController();
  TextEditingController option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();
  TextEditingController paperNo = TextEditingController();
  String correctOption ="";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(156, 190, 244, 1),
          Color.fromRGBO(194, 232, 251, 1),
        ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Upload Questions",style: TextStyle(color: Colors.black),),
          actions: [
            SizedBox(
              width: size.width*0.3,
              child: Card(
                child: TextField(
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  controller: paperNo,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "Paper No",
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: size.height*0.02,),
            paperNo.text ==""
                ?
            const Text("Please enter Paper No. First",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
                :
            StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Test").doc("Practice Test ${paperNo.text.trim()}").snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ?
            snapshot.data!.data() == null
                ?
            const Text("Question No. 1")
                :
            Text("Question No. ${snapshot.data!.data()?["Questions"].length+1}")
                :
            const Text("Wait......");
          },),
            SizedBox(height: size.height*0.02,),
            Card(
              child: TextField(
                maxLines: 10,
                controller: question,
                decoration: const InputDecoration(
                  hintText: "Question",
                  contentPadding: EdgeInsets.all(10)
                ),
              ),
            ),
            Card(
              child: TextField(
                maxLines: 1,
                controller: option1,
                decoration: InputDecoration(
                    hintText: "Option 1",
                    contentPadding: EdgeInsets.all(10),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          correctOption = option1.text.trim();
                        });
                      },
                      icon: Icon(
                        Icons.check,color: (correctOption !="" && option1.text == correctOption) ? Colors.green : Colors.grey,
                      ),
                    )
                ),
              ),
            ),
            Card(
              child: TextField(
                maxLines: 1,
                controller: option2,
                decoration: InputDecoration(
                    hintText: "option 2",
                    contentPadding: EdgeInsets.all(10),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          correctOption = option2.text.trim();
                        });
                      },
                      icon: Icon(
                        Icons.check,color: (correctOption !="" && option2.text == correctOption) ? Colors.green : Colors.grey,
                      ),
                    )
                ),
              ),
            ),
            Card(
              child: TextField(
                maxLines: 1,
                controller: option3,
                decoration: InputDecoration(
                  hintText: "Option 3",
                    contentPadding: EdgeInsets.all(10),
                    suffixIcon: IconButton(
                      onPressed: (){
                          setState(() {
                            correctOption = option3.text.trim();
                          });
                      },
                      icon: Icon(
                        Icons.check,color: (correctOption !="" && option3.text == correctOption) ? Colors.green : Colors.grey,
                      ),
                    )
                ),
              ),
            ),
            Card(
              child: TextField(
                maxLines: 1,
                controller: option4,
                decoration: InputDecoration(
                    hintText: "Option 4",
                    contentPadding: EdgeInsets.all(10),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          correctOption = option4.text.trim();
                        });
                      },
                      icon: Icon(
                        Icons.check,color: (correctOption !="" && option4.text == correctOption) ? Colors.green : Colors.grey,
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if(
              option1.text.isNotEmpty &&
              option2.text.isNotEmpty &&
              option3.text.isNotEmpty &&
              option4.text.isNotEmpty &&
              question.text.isNotEmpty &&
              paperNo.text.isNotEmpty
              ){
                final translator = GoogleTranslator();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const loading(text: "Please wait...\n uploading on server....");
                },));
                List<dynamic> options = [
                  option1.text.trim(),
                  option2.text.trim(),
                  option3.text.trim(),
                  option4.text.trim(),
                ];
                String questionh ="";
                await translator.translate(question.text.trim(), to: 'hi').then((value){
                  questionh = value.text;
                }).whenComplete(() async {
                  for(int j=0; j<4 ; j++ ){
                    await translator.translate(options[j], to: 'hi').then((value){
                      options[j]=value.text.trim();
                    });
                  }
                });
                await FirebaseFirestore.instance.collection("Test").doc("Practice Test ${paperNo.text.trim()}").get().then((value) async {
                  if(value.data() != null){
                    await FirebaseFirestore.instance.collection("Test").doc("Practice Test ${paperNo.text.trim()}").update({
                      "Questions" : FieldValue.arrayUnion([{
                        "Options" : [
                          option1.text.trim(),
                          option2.text.trim(),
                          option3.text.trim(),
                          option4.text.trim(),
                        ],
                        "Question" : question.text.trim(),
                        "QuestionH" : questionh,
                        "OptionsH" : options,
                        "Correct option" : correctOption
                      }])
                    });
                  }
                  else{
                    await FirebaseFirestore.instance.collection("Test").doc("Practice Test ${paperNo.text.trim()}").set({
                      "Questions" : FieldValue.arrayUnion([{
                        "Options" : [
                          option1.text.trim(),
                          option2.text.trim(),
                          option3.text.trim(),
                          option4.text.trim(),
                        ],
                        "Question" : question.text.trim(),
                        "QuestionH" : questionh,
                        "OptionsH" : options,
                        "Correct option" : correctOption
                      }])
                    });
                  }
                }).whenComplete((){
                  setState(() {
                    option1.clear();
                    option2.clear();
                    option3.clear();
                    option4.clear();
                    question.clear();
                  });
                  Navigator.pop(context);
                });
              }
              else{
                ScaffoldMessenger
                    .of(context)
                    .showSnackBar(
                    SnackBar(

                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(bottom: size.height*0.82),
                        content: const Text("Please fill all the fields"),
                    ),
                );
              }
            },
            child: const Icon(Icons.upload),
        ),
      ),
    );
  }
}

