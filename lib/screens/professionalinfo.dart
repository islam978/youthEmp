import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youth_emp/screens/Services.dart';
import 'package:youth_emp/utils/constant.dart';
import 'login.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:youth_emp/generated/l10n.dart';



class ProfissionalInfo extends StatefulWidget {
  static const String id = 'profissionalinfo';

  @override
  ProfissionalInfoState createState() {
    return ProfissionalInfoState();
  }
}



class ProfissionalInfoState extends State<ProfissionalInfo> {
  String email;
  String _verticalGroupValue = " ";

  String dropdownValue;
  List<String> _languagelevel = ["ممتاز","جيد", "مقبول", "ضعيف"];
  List<String> _license = ["نعم", "لا"];

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


  String validateNationalNo(String value) {
    bool isNationalNo = value.isEmail();
    if (value.isEmpty) {
      return 'Please enter National number';
    } else {
      if (!isNationalNo)
        return 'Please enter valid  National number';
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
      appBar: AppBar(title: Text(S.of(context).professionalInfo)),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          onChanged: _onFormChange,
          onWillPop: _onWillPop,
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).educationAttainment, style: TextStyle(color: Colors.black ,fontFamily: 'SFUIDisplay') ,),

              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(S.of(context).certificate, style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),),
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
                      items: <String>[S.of(context).illiterate, S.of(context).primary, S.of(context).secondary, S.of(context).institute,S.of(context).university,S.of(context).master]
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(

                        child:Text(S.of(context).specialization, style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),),

                      ),

                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          style:
                          TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                          onSaved: (value) {
                            myData.add(value);
                          },
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),



                          ),


                          autofocus: true,
                          keyboardType: TextInputType.name,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(S.of(context).studyYear, style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),),
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
                      items: <String>['1', ' 2', '3', '4','5','6']
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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(S.of(context).languages, style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),),
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
                      items: <String>[S.of(context).arabic, S.of(context).english,S.of(context).french]
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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(S.of(context).license, style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay',),
                    ),

                    RadioGroup<String>.builder(
                      direction: Axis.horizontal,
                      groupValue: _verticalGroupValue,
                      onChanged: (value) => setState(() {
                        _verticalGroupValue = value;
                      }),
                      items: _license,
                      itemBuilder: (item) => RadioButtonBuilder(
                        item,
                      ),
                      activeColor: Colors.blue,
                    ),

                  ],
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Text(S.of(context).talentOfComputer, style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),),

                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style:
                        TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                        onSaved: (value) {
                          myData.add(value);
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),

                        ),


                        autofocus: true,
                        keyboardType: TextInputType.name,

                      ),
                    ),
                  ),

                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(

                  onPressed: () {

                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Services()));
                  },

                  child: Text(S.of(context).submit),

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
