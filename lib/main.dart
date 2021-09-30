import 'package:flutter/material.dart';
import 'package:youth_emp/screens/Services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:youth_emp/screens/splash.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {

  runApp(
      MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,

    //  title: S.of(context).title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}



