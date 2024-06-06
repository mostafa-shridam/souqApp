import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:souq/core/helper_functions/on_generate_helper.dart';
import 'package:souq/features/splash/presention/views/splash_view.dart';
import 'package:souq/generated/l10n.dart';

void main() {
  runApp(const SouqApp());
}

class SouqApp extends StatefulWidget {
  const SouqApp({super.key});

  @override
  State<SouqApp> createState() => _SouqAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _SouqAppState? state = context.findAncestorStateOfType<_SouqAppState>();
    state?.setLocale(newLocale);
  }
}



class _SouqAppState extends State<SouqApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: 'Cairo',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              TextStyle(),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Cairo',
        useMaterial3: true,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      locale: _locale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
