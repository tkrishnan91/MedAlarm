import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medalarm/constants/constants.dart';

class TakeMedScreen extends StatefulWidget {
  TakeMedScreen();

  @override
  State<StatefulWidget> createState() {
    return _TakeMedScreenState();
  }
}

class _TakeMedScreenState extends State<TakeMedScreen> {
  String _imagePath;
  Widget image;
  double _headerHeight = 320.0;
  final String _assetImagePath = 'assets/images/ic_no_image.png';

  _TakeMedScreenState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _imagePath != null
                ? _getImageFromFile(_imagePath)
                : _getImageFromAsset(),
            _getCameraFab(),
            _getMedicineInfo(),
          ],
        ));
  }

  Widget _getImageFromAsset() {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.0),
      child: Container(
          width: double.infinity,
          height: _headerHeight,
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                _assetImagePath,
                //fit: BoxFit.fill,
                width: 60.0,
                height: 60.0,
                //centerSlice: Rect.fromLTRB(2.0, 2.0, 2.0, 2.0),
                //colorBlendMode: BlendMode.srcOver,
                //color: Color.fromARGB(120, 20, 10, 40),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text(
                  'No Image Available',
                  style: TextStyle(
                    color: Colors.grey[350],
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _getImageFromFile(String imagePath) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.0),
      child: Image.file(
        File(
          imagePath,
        ),
        fit: BoxFit.cover,
        width: double.infinity,
        height: _headerHeight,
      ),
    );
  }

  Widget _getTopHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.menu, size: 32.0, color: Colors.white),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                "My Profile",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Icon(Icons.mode_edit, color: Colors.white),
        ],
      ),
    );
  }

  Widget _getCameraFab() {
    return Positioned(
      top: _headerHeight - 30.0,
      right: 16.0,
      child: FloatingActionButton(
        onPressed: _openCamera,
        child: Icon(
          Icons.photo_camera,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _getMedicineInfo() {
    return Container(
      margin: EdgeInsets.only(top: 200.0),
      alignment: Alignment.center,
      child: Center(
          child: _imagePath == null ?
          Text("Time to take Zonegram 150mg",
            textScaleFactor: 2,):
          IconButton(
            icon: Icon(Icons.done),
            color: Colors.green,
            iconSize: 200,
            tooltip: 'Accept the picture',
            onPressed: () {
              Navigator.pushNamed(context, MEDHISTORY_SCREEN);
//              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          )
      ),
    );
  }

  Future _openCamera() async {
    final imagePath = await Navigator.of(context).pushNamed(CAMERA_SCREEN);

    setState(() {
      _imagePath = imagePath;
    });

    if (imagePath != null) {
      print("$imagePath");

      image = Image.file(
        File(imagePath),
        height: _headerHeight,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }
  }
}
