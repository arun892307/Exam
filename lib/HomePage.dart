import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_ptalform/loadingscreen.dart';
import 'TakeQuize.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController question=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText("Home"),
        actions: [
          IconButton(onPressed: () async {
            await FirebaseAuth.instance.signOut();
          }, icon: Icon(Icons.logout,color: Colors.black54,))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Test").doc("Practice Test 1").snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasData ?
          ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.data()?.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: AutoSizeText("Practice Test ${index+1}"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                       return QuizScreen(notesId: index+1,);
                    },));
                  },
                ),
              );
            },
          )
          :
          loading(text: "Please wait...");
        },
      )
    );
  }
}
