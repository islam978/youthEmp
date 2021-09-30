import 'package:flutter/material.dart';
import 'package:youth_emp/utils/constant.dart';
class MYTEXT extends StatelessWidget {
  final  Color color;
  final double fontSize;
  final String fontFamily;
  final String text;

  const MYTEXT({Key key, this.color=kColorText, this.fontSize, this.fontFamily,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style:TextStyle(color: color,fontSize: fontSize,fontFamily: kFontText));
  }
}
