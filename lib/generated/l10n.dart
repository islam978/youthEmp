// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `تمكين الشباب`
  String get title {
    return Intl.message(
      'تمكين الشباب',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني`
  String get email {
    return Intl.message(
      'البريد الإلكتروني',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `تخطي`
  String get skip {
    return Intl.message(
      'تخطي',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `يقدم مركز تمكين الشباب خدمات الإنشاء الوظيفي وبناء القدرات وريادة الأعمال وغيرها `
  String get intro1 {
    return Intl.message(
      'يقدم مركز تمكين الشباب خدمات الإنشاء الوظيفي وبناء القدرات وريادة الأعمال وغيرها ',
      name: 'intro1',
      desc: '',
      args: [],
    );
  }

  /// `من خلال مراكزه المنتشرة في اغلب المحافظات السورية`
  String get intro2 {
    return Intl.message(
      'من خلال مراكزه المنتشرة في اغلب المحافظات السورية',
      name: 'intro2',
      desc: '',
      args: [],
    );
  }

  /// ` مشروع يهدف لزيادة قابلية توظيف الشباب (مابين 12 الى 45 عاما)  `
  String get intro3 {
    return Intl.message(
      ' مشروع يهدف لزيادة قابلية توظيف الشباب (مابين 12 الى 45 عاما)  ',
      name: 'intro3',
      desc: '',
      args: [],
    );
  }

  /// `وتحسين وصولهم الى الفرص المتاحة بسوق العمل `
  String get intro4 {
    return Intl.message(
      'وتحسين وصولهم الى الفرص المتاحة بسوق العمل ',
      name: 'intro4',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `أهلا بكم في تطبيق مركز تمكين الشباب`
  String get welcome {
    return Intl.message(
      'أهلا بكم في تطبيق مركز تمكين الشباب',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `انشاء حساب`
  String get createAccount {
    return Intl.message(
      'انشاء حساب',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login {
    return Intl.message(
      'تسجيل الدخول',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `اسم المستخدم`
  String get user {
    return Intl.message(
      'اسم المستخدم',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `رقم الموبايل`
  String get phone {
    return Intl.message(
      'رقم الموبايل',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد`
  String get submit {
    return Intl.message(
      'تأكيد',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `هل لديك حساب ؟`
  String get have_an_account {
    return Intl.message(
      'هل لديك حساب ؟',
      name: 'have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `تصفح الدورات`
  String get browseCourses {
    return Intl.message(
      'تصفح الدورات',
      name: 'browseCourses',
      desc: '',
      args: [],
    );
  }

  /// `تم`
  String get done {
    return Intl.message(
      'تم',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `تدريب مهني`
  String get serv1 {
    return Intl.message(
      'تدريب مهني',
      name: 'serv1',
      desc: '',
      args: [],
    );
  }

  /// `تعليم مستمر `
  String get serv2 {
    return Intl.message(
      'تعليم مستمر ',
      name: 'serv2',
      desc: '',
      args: [],
    );
  }

  /// `ريادة أعمال`
  String get serv3 {
    return Intl.message(
      'ريادة أعمال',
      name: 'serv3',
      desc: '',
      args: [],
    );
  }

  /// `مسار وظيفي`
  String get serv4 {
    return Intl.message(
      'مسار وظيفي',
      name: 'serv4',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}