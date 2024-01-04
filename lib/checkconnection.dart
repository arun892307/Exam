
import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'MainPage.dart';

class Checkconnection extends StatelessWidget {
  Checkconnection({Key? key}) : super(key: key);
  Connectivity connectivity=Connectivity();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ConnectivityResult>(
          stream: connectivity.onConnectivityChanged,
          builder: (_,snapshot){
            return Internetcheck(snapshot: snapshot, widget: const MainPage(),);
          }
      ),
    );
  }
}

class Internetcheck extends StatefulWidget {
  final AsyncSnapshot<ConnectivityResult> snapshot;
  final Widget widget;
  const Internetcheck({Key? key, required this.snapshot, required this.widget}) : super(key: key);

  @override
  State<Internetcheck> createState() => _InternetcheckState();
}

class _InternetcheckState extends State<Internetcheck> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    if(kIsWeb){
      return widget.widget;
    }
    switch(widget.snapshot.connectionState){
      case ConnectionState.active:
        final state = widget.snapshot.data!;
        switch(state){
          case ConnectivityResult.none:
            print("......none");
            return const AutoSizeText("No Internet");
          case ConnectivityResult.bluetooth:
            return const Center(child: Text("You are not connected to internet... you are connected to bluetooth"));
          case ConnectivityResult.ethernet:
            return widget.widget;
          case ConnectivityResult.mobile:
            return widget.widget;
          case ConnectivityResult.wifi:
            return widget.widget;
          default:
            return const Center(child:Text("Other problems"));
        }
      default:
        print("..............here");
        return const AutoSizeText("No Internet");
    }
  }
}
