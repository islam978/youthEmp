import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:youth_emp/generated/l10n.dart';
import 'package:youth_emp/screens/registration_screen.dart';
import 'package:youth_emp/utils/constant.dart';
import 'package:youth_emp/widget/myButton.dart';
import 'package:youth_emp/widget/myText.dart';

import 'Services.dart';
import 'login.dart';
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return
      Stack(
        children: [Image.asset('images/23.jpg',width:wi ,height: he,fit: BoxFit.fill,),
          Scaffold(
          backgroundColor: Colors.transparent,
           body: LayoutBuilder(builder:(ctx,sizes) {
             var h1= sizes.maxHeight;
             var w1 =sizes.maxWidth;

             return

              Center(
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.start,
                 // crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
             Image.asset('images/logo1.png',width:0.7*w1 ,height:0.5*h1,),
                    MYTEXT(text: S.of(context).welcome,fontSize: 0.05*min(h1,w1),color:Color(0XFF3371f2),fontFamily: 'Cairo-SemiBold',),
                 //   SvgPicture.asset("images/call.svg",color: Colors.red,)
                SizedBox(height: 0.29*h1,),
                  Expanded(
                    child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    MyButton(text:S.of(context).createAccount,h:h1*0.7,w:w1*0.7,fun:()=>Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => RegisterScreen()))),
                    SizedBox(width: 0.03*w1,),
                    MyButton(text:S.of(context).login,h:h1*0.7,w:w1*0.7,fun:()=>Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen())),),
                      SizedBox(width: 0.03*w1,),
                      MyButton(text:S.of(context).browseCourses,h:h1*0.7,w:w1*0.7,fun:()=>Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Services())),)

                ],),
                  ),

                  ],
                ),
              );}
           ),

    ),
       ]);
  }
}
