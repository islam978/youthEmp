import 'package:flutter/material.dart';
import 'package:youth_emp/utils/constant.dart';
import 'Services.dart';
import 'login.dart';
import 'package:regexpattern/regexpattern.dart';

class PersonalScreen2 extends StatefulWidget {
  static const String id = 'personal2_screen';

  @override
  PersonalScreen2State createState() {
    return PersonalScreen2State();
  }
}

class PersonalScreen2State extends State<PersonalScreen2> {
  String email;
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
      appBar: AppBar(title: Text("المعلومات الشخصية")),
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
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  onSaved: (value) {
                    myData.add(value);
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'المدينة',
                  ),
                  autofocus: true,
                  keyboardType: TextInputType.name,

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  onSaved: (value) {
                    myData.add(value);
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'العنوان',
                  ),
                  autofocus: true,
                  keyboardType: TextInputType.name,

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  onSaved: (value) {
                    myData.add(value);
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'البريد الإلكتروني',
                      prefixIcon: Icon(
                        Icons.email,
                        color: colorButton1,
                      ),
                      ),
                  validator: (value) {
                    return validateEmail(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  onSaved: (value) {
                    myData.add(value);
                  },
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'رقم الهاتف',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: colorButton1,
                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                  autofocus: true,
                  keyboardType: TextInputType.phone,

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  onSaved: (value) {
                    myData.add(value);
                  },
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'رقم الموبايل',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: colorButton1,
                      ),
                      ),
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    return validatePhone(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  onSaved: (value) {
                    myData.add(value);
                  },
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'رقم الوطني',

                      ),
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return validateNationalNo(value);
                  },
                ),
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
                        MaterialPageRoute(builder: (context) => Services()));
                  },
                  child: Text('التالي'),

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
