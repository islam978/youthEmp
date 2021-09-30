import 'package:flutter/material.dart';
import 'package:youth_emp/generated/l10n.dart';
import 'package:youth_emp/utils/constant.dart';
import 'package:youth_emp/widget/myButton.dart';
import 'login.dart';
import 'package:regexpattern/regexpattern.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  RegisterScreenState createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  String email;
  String password;
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

  String validatePassword(String value) {
    /// Password (Hard) Regex
    /// Allowing all character except 'whitespace'
    /// Must contains at least: 1 uppercase letter, 1 lowecase letter, 1 number, & 1 special character (symbol)
    /// Minimum character: 8
    bool isHardPassword = value.isPasswordHard();
    if (value.isEmpty) {
      return 'يرجى ادخال كلمة المرور';
    } else {
      if (!isHardPassword)
        return 'يجب ان تكون اكثر من 6 محارف';
      else
        return null;
    }
  }

  String validateEmail(String value) {
    bool isEmail = value.isEmail();
    if (value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    } else {
      if (!isEmail)
        return 'ادخل بريدك الإلكتروني النشط ';
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
      return 'رقم الموبايل مطلوب';
    } else {
      if (!isPhone)
        return 'ادخل رقم موبايل فعال';
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
              child: Text("إلغاء"),
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
      appBar: AppBar(title: Text("تسجيل حساب")),
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
                  initialValue: '',
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  onSaved: (value) {
                    myData.add(value);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                      labelText: S.of(context).user,
                      prefixIcon: Icon(
                        Icons.person,
                        color: colorButton1,
                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'يرجى تعبئة الحقل المطلوب';
                    }
                    return null;
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
                      border: OutlineInputBorder(borderRadius :BorderRadius.circular(18.0)),
                      labelText: S.of(context).phone,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: colorButton1,
                      ),
                      labelStyle: TextStyle(fontSize: 15)),
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
                      border: OutlineInputBorder(borderRadius :BorderRadius.circular(18.0)),
                      labelText: S.of(context).email,
                      prefixIcon: Icon(
                        Icons.email,
                        color: colorButton1,
                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                  validator: (value) {
                    return validateEmail(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  onSaved: (value) {
                    myData.add(value);
                  },
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius :BorderRadius.circular(18.0)),
                      labelText: S.of(context).password,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: colorButton1,
                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                  validator: (value) {
                    return validatePassword(value);
                  },
                  controller: _pass,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) {
                    myData.add(value);
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius :BorderRadius.circular(18.0)
                      ),
                      labelText: '${S.of(context).submit}${S.of(context).password}',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: colorButton1,
                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                  validator: (value) {
                    if (value != _pass.text) {
                      return "كلمة المرور غير متماثلة";
                    } else
                      return null;
                  },
                ),
              ),

                 MyButton(text: S.of(context).submit,h: MediaQuery.of(context).size.height,
                    w:MediaQuery.of(context).size.width,

                    fun:(){
                if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  _formKey.currentState.reset();
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('يرجى الانتظار')));

    }}
                // child: ElevatedButton(
                //   style: ButtonStyle(shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                //       RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(18.0),
                //
                //       ),)),
                //
                //   onPressed: () {
                //     if (_formKey.currentState.validate()) {
                //       _formKey.currentState.save();
                //       _formKey.currentState.reset();
                //       ScaffoldMessenger.of(context).showSnackBar(
                //           SnackBar(content: Text('يرجى الانتظار')));
                //     }
                //   },
                //   child: Text('تأكيد'),
                // ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Center(
                  child: InkWell(
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
                            text: S.of(context).login,
                            style: TextStyle(
                              fontFamily: 'SFUIDisplay',
                              color: Colors.blueAccent,
                              fontSize: 15,
                            ))
                      ]),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginScreen.id);
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
