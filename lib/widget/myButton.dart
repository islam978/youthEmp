import 'dart:math';
import 'package:youth_emp/utils/constant.dart';
import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
 final String text;
  final double h;
  final double w;
  final Function fun;

  const MyButton({Key key, this.text, this.h, this.w,this.fun}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      SizedBox(width:0.35*w,
      height: 0.05*h,
      child: LayoutBuilder(
        builder:(ctx,size){
          var hi = size.maxHeight;
          var wi  =size.maxWidth;
          return  ElevatedButton(

            onPressed: fun, child: Text(text,style: TextStyle(fontSize:0.4*min(hi,wi) ,color: Colors.white),),
            style: ButtonStyle(shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),

                )
            ),

              backgroundColor: MaterialStateProperty.all(colorButton1),),);
        },
      )
    );
  }
}
