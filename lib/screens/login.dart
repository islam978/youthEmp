import 'package:flutter/material.dart';
import 'package:youth_emp/generated/l10n.dart';
import 'package:youth_emp/screens/personalform.dart';
import 'package:youth_emp/utils/constant.dart';
import 'package:youth_emp/utils/constant.dart';
import 'package:youth_emp/widget/myButton.dart';
import 'Services.dart';
import 'registration_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
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

  Future<bool> _onWillPop() {
    if (!_formChanged) return Future<bool>.value(true);
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
              "Are you sure you want to abandon the form? Any changes will be lost."),
          actions: <Widget>[
            MyButton(

              text: "Cancel",
              fun: () => Navigator.of(context).pop(false),
              // textColor: Colors.black,
            ),
            MyButton(
              text:"Abandon",
              // textColor: Colors.red,
              fun: () => Navigator.pop(context, true),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).login),
      ),
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
                      border: OutlineInputBorder(
                          borderRadius :BorderRadius.circular(18.0)
                      ),
                      labelText: S.of(context).email,
                      prefixIcon: Icon(
                        Icons.email,
                        color: colorButton1,
                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  onSaved: (value) {
                    myData.add(value);
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(

                      border: OutlineInputBorder(
                          borderRadius :BorderRadius.circular(18.0)
                      ),
                      labelText: S.of(context).password,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: colorButton1,
                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      _formKey.currentState.reset();
                      ScaffoldMessenger.of(context).showSnackBar(

                          SnackBar(content: Text('يرجى الانتظار')));
                    }
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => PersonalScreen()));
                  },
                  child: Text(S.of(context).submit),
                  style: ButtonStyle(shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),

                      )),
                  ),
                ),),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Text(
                    'هل نسيت كلمة المرور؟',
                    style: TextStyle(
                        fontFamily: 'SFUIDisplay',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Center(
                  child: GestureDetector(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: S.of(context).have_an_account,
                            style: TextStyle(
                              fontFamily: 'SFUIDisplay',
                              color: Colors.black,
                              fontSize: 15,
                            )),
                        TextSpan(
                            text: S.of(context).createAccount,
                            style: TextStyle(
                              fontFamily: 'SFUIDisplay',
                              color: Colors.blueAccent,
                              fontSize: 15,
                            ))
                      ]),
                    ),
                    onTap: () {

                      Navigator.of(context).pushNamed(RegisterScreen.id);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
