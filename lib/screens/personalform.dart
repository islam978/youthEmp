
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youth_emp/screens/personalform2.dart';
import 'package:youth_emp/utils/constant.dart';
import 'login.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:group_radio_button/group_radio_button.dart';

class PersonalScreen extends StatefulWidget {
  static const String id = 'personal_screen';

  @override
  PersonalScreenState createState() {
    return PersonalScreenState();
  }
}

class PersonalScreenState extends State<PersonalScreen> {
  String email;
  String password;
  String _verticalGroupValue = " ";
  List<String> _gender = ["ذكر", "انثى"];
  List<String> _social = ["عازب", "متزوج/ة", "ارمل/ة", "منفصل/ة"];
  String dropdownValue;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  bool _formChanged = false;
  FocusNode focusNode;

  List myData = [];
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }



  String validateEmail(String value) {
    bool isEmail = value.isEmail();
    if (value.isEmpty) {
      return 'Email is required';
    } else {
      if (!isEmail)
        return 'Enter valid Email';
      else
        return null;
    }
  }

  String validatePhone(String value) {
    /// Phone Number regex
    /// Must started by either, "0", "+", "+XX <X between 2 to 4 digit>", "(+XX <X between 2 to 3 digit>)"
    /// Can add whitespace separating digit with "+" or "(+XX)"
    /// Example: 05555555555, +555 5555555555, (+123) 5555555555, (555) 5555555555, +5555 5555555555
    bool isPhone = value.isPhone();
    if (value.isEmpty) {
      return 'Phone number is required';
    } else {
      if (!isPhone)
        return 'Enter valid Phone number';
      else
        return null;
    }
  }

  Future<bool> _onWillPop() {
    if (!_formChanged) return Future<bool>.value(true);
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
              "Are you sure you want to abandon the form? Any changes will be lost."),
          actions: <Widget>[
            OutlinedButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(false),

            ),
            OutlinedButton(
              child: Text("Abandon"),

              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        ) ??
            false;
      },
    );
  }

  void _onFormChange() {
    if (_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(title: Text("المعلومات الشخصية")),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          onChanged: _onFormChange,
          onWillPop: _onWillPop,
          key: _formKey,
          child: LayoutBuilder(
            builder:(ctx, size){ return  ListView(
              shrinkWrap: true,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    style:
                    TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                    onSaved: (value) {
                      myData.add(value);
                    },
                    decoration: InputDecoration(

                        border: UnderlineInputBorder(),
                        hintText: 'اسم المستخدم',
                      hintTextDirection: TextDirection.rtl
                    ),
                    autofocus: true,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'يرجى تبعئة الحقل المطلوب';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          textDirection: TextDirection.rtl,

                          style:
                          TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                          onSaved: (value) {
                            myData.add(value);
                          },
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'اسم الأب',
                            hintTextDirection: TextDirection.rtl


                              ),


                          autofocus: true,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'يرجى تبعئة الحقل المطلوب';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          textDirection: TextDirection.rtl,
                          style:
                          TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                          onSaved: (value) {
                            myData.add(value);
                          },
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'اسم الأم',
                            hintTextDirection: TextDirection.rtl


                          ),


                          autofocus: true,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'يرجى تبعئة الحقل المطلوب';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Text("الجنس:", style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay',),
                      ),

                      LayoutBuilder(
                        builder:(ctx, size){return  RadioGroup<String>.builder(

                          direction: Axis.horizontal,
                          groupValue: _verticalGroupValue,
                          onChanged: (value) => setState(() {
                            _verticalGroupValue = value;
                          }),
                          items: _gender,
                          itemBuilder: (item) => RadioButtonBuilder(
                            item,
                          ),
                          activeColor: Colors.blue,
                        );}
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Text("الحالة الاجتماعية:", style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),),

                      RadioGroup<String>.builder(
                        direction: Axis.horizontal,
                        groupValue: _verticalGroupValue,
                        onChanged: (value) => setState(() {
                          _verticalGroupValue = value;
                        }),
                        items: _social,
                        itemBuilder: (item) => RadioButtonBuilder(

                          item,
                        ),
                        activeColor: Colors.blue,
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Text("هل يوجد إعاقة:", style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),),
                    DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['لا يوجد', 'فيزيائية', 'عقلية', 'عينية','سماعية']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child:Text("عدد افراد العائلة:", style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),),

                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          style:
                          TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                          onSaved: (value) {
                            myData.add(value);
                          },
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'العدد',


                          ),


                          autofocus: true,
                          keyboardType: TextInputType.name,

                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(

                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _formKey.currentState.reset();
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('يرجى الانتظار')));
                      }
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => PersonalScreen2()));
                    },
                    child: Text('التالي'),

                  ),
                ),

              ],
            );}
          ),
        ),
      ),
    );
  }
}
