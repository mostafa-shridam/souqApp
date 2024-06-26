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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Souq`
  String get appBarTitle {
    return Intl.message(
      'Souq',
      name: 'appBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `SOUQ`
  String get title {
    return Intl.message(
      'SOUQ',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `HUB`
  String get title1 {
    return Intl.message(
      'HUB',
      name: 'title1',
      desc: '',
      args: [],
    );
  }

  /// `Search and shop`
  String get title2 {
    return Intl.message(
      'Search and shop',
      name: 'title2',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best offers and high quality.`
  String get subtitle1 {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best offers and high quality.',
      name: 'subtitle1',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the best carefully selected fruits. See details, photos and reviews to make sure you choose the perfect fruit.`
  String get subtitle2 {
    return Intl.message(
      'We offer you the best carefully selected fruits. See details, photos and reviews to make sure you choose the perfect fruit.',
      name: 'subtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipButton {
    return Intl.message(
      'Skip',
      name: 'skipButton',
      desc: '',
      args: [],
    );
  }

  /// `Start now`
  String get startButton {
    return Intl.message(
      'Start now',
      name: 'startButton',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get appBarLogin {
    return Intl.message(
      'Login',
      name: 'appBarLogin',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get appBarSignUp {
    return Intl.message(
      'New Account',
      name: 'appBarSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get nameHintText {
    return Intl.message(
      'Full name',
      name: 'nameHintText',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name first`
  String get validatorName {
    return Intl.message(
      'Please enter your name first',
      name: 'validatorName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailHintText {
    return Intl.message(
      'Email',
      name: 'emailHintText',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get validateEmail {
    return Intl.message(
      'Please enter your email',
      name: 'validateEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid '@' `
  String get validateEmailCheck {
    return Intl.message(
      'Please enter valid \'@\' ',
      name: 'validateEmailCheck',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passHintText {
    return Intl.message(
      'Password',
      name: 'passHintText',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get validatePass {
    return Intl.message(
      'Please enter your password',
      name: 'validatePass',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forgetPass {
    return Intl.message(
      'Forget password?',
      name: 'forgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Dont't have account?`
  String get createAccountQuestion {
    return Intl.message(
      'Dont\'t have account?',
      name: 'createAccountQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Create one`
  String get createAccount {
    return Intl.message(
      'Create one',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Continue with google`
  String get googleButton {
    return Intl.message(
      'Continue with google',
      name: 'googleButton',
      desc: '',
      args: [],
    );
  }

  /// `Continue with apple`
  String get appleButton {
    return Intl.message(
      'Continue with apple',
      name: 'appleButton',
      desc: '',
      args: [],
    );
  }

  /// `Continue with facebook`
  String get facebookButton {
    return Intl.message(
      'Continue with facebook',
      name: 'facebookButton',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get loginDivider {
    return Intl.message(
      'Or',
      name: 'loginDivider',
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
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
