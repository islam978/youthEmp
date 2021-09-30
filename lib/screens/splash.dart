import 'dart:async';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:youth_emp/screens/intro.dart';
import 'package:youth_emp/screens/welcome.dart';
import 'package:youth_emp/utils/constant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:youth_emp/mydb_manager.dart';

class Splash extends StatefulWidget {




  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      return
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) =>  Welcome()));
    } else {
      await prefs.setBool('seen', true);
      return
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => Intro()));
    }
  }
  @override
  void initState() {
    //DBCourseManager d;
    //d.openDB();
   Timer(Duration(seconds: 5), () {
      checkFirstSeen();
      super.initState(); });

  }
  @override
  Widget build(BuildContext context) {

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;


      return SplashScreen(
        imageBackground:Image.asset('images/23.jpg',width: w,height: h,).image,
        seconds: 3,
      // navigateAfterSeconds:  AfterSplash(),
       /* title: new Text(
          'مركز تمكين الشباب',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 0.1*min(h,w),color: Color(0xFFFCD982)),
        ),*/
        image:
        Image.asset('images/logo1.png'),
        backgroundColor: Colors.white,
        photoSize: 0.25*min(h,w),
        loaderColor:colorButton2,

    );
  }
}


