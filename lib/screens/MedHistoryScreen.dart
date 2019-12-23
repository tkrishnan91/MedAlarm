import 'dart:io';

import 'package:flutter/material.dart';


class MedHistoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MedHistoryScreenState();
  }

}

class _MedHistoryScreenState extends State<MedHistoryScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
       Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Med History"),
          ),
           body: ListView(
             children: <Widget>[Card(
                 child: Column(children: [
                   Container(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget>[
                             Text("Friday November 28th",
                             textScaleFactor: 2,),
                           ],
                         ),
                       )),
                   Padding(
                     padding: EdgeInsets.all(10.0),
                     child: Image.file(
                       File(
                        "/data/user/0/com.tsri.medalarm/app_flutter/FlutterDevs/Camera/Images/1574567633794.jpg",
                       ),
                       fit: BoxFit.cover,
                       width: double.infinity,
                       height: 120,
                     ),
                   ),
                   Container(
                     child: Row(
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Column(
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text("Medication: ",
                                 textScaleFactor: 1.2,),
                               ),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text("Time taken: ",
                                 textScaleFactor: 1.2,),
                               ),
                             ],
                           ),
                         ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text("Zonegran 100mg, Zongegran 50mg",),
                               ),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text("8:10 am"),
                               ),
                             ],
                           ),
                       ],
                     ),
                   ),

                 ])
             ),Card(
                 child: Column(children: [
                   Container(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget>[
                             Text("Friday November 28th",
                               textScaleFactor: 2,),
                           ],
                         ),
                       )),
                   Padding(
                     padding: EdgeInsets.all(10.0),
                     child: Image.file(
                       File(
                         "/data/user/0/com.tsri.medalarm/app_flutter/FlutterDevs/Camera/Images/1574567633794.jpg",
                       ),
                       fit: BoxFit.cover,
                       width: double.infinity,
                       height: 120,
                     ),
                   ),
                   Container(
                     child: Row(
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Column(
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text("Medication: "),
                               ),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text("Time taken: "),
                               ),
                             ],
                           ),
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text("Zonegran 100mg, Zongegran 50mg",),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text("8:10 am"),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),

                 ])
             ),Card(
                 child: Column(children: [
                   Container(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget>[
                             Text("Friday November 29th",
                               textScaleFactor: 2,),
                           ],
                         ),
                       )),
                   Padding(
                     padding: EdgeInsets.all(10.0),
                     child: Image.file(
                       File(
                         "/data/user/0/com.tsri.medalarm/app_flutter/FlutterDevs/Camera/Images/1574567633794.jpg",
                       ),
                       fit: BoxFit.cover,
                       width: double.infinity,
                       height: 120,
                     ),
                   ),
                   Container(
                     child: Row(
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Column(
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text("Medication: "),
                               ),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text("Time taken: "),
                               ),
                             ],
                           ),
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text("Zonegran 100mg, Zongegran 50mg",),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text("8:10 am"),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),

                 ])
             ),

             ],
            )
        );
  }

  @override
  void initState() {
    super.initState();
  }
}

