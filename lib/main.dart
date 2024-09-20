import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/helper_functions/on_generate_helper.dart';
import 'package:souq/core/services/get_it_services.dart';
import 'package:souq/core/services/shared/bloc_observer.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/theme_mode.dart';
import 'package:souq/features/account/cubit/account_cubit.dart';
import 'package:souq/features/auth/data/domain/repo/auth_repo.dart';
import 'package:souq/features/splash/presention/views/splash_view.dart';
import 'package:souq/firebase_options.dart';
import 'package:souq/generated/l10n.dart';
import 'package:souq/views/nav_views/cubit/nav_bar_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.appAttest,
    webProvider: ReCaptchaV3Provider(kWebProvider),
  );

  Bloc.observer = await CustomBlocObserver();
  await FirebaseAppCheck.instance.activate();
  await Prefs.init();
  setupGetIt();
  Intl.getCurrentLocale();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          Prefs.getBool(kIsDarkMode) ? Brightness.light : Brightness.dark,
    ),
  );
  runApp(const SouqApp());
}

class SouqApp extends StatelessWidget {
  const SouqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(getIt<AuthRepo>()),
        ),
        BlocProvider(
          create: (context) => AccountCubit(),
        ),
      ],
      child: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          return MaterialApp(
            theme: Prefs.getBool(kIsDarkMode) == false
                ? themeDataLight()
                :  themeDataDark(),
            debugShowCheckedModeBanner: false,
            locale: changeLanguage(),
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
        },
      ),
    );
  }

  Locale changeLanguage() {
    if (Prefs.getBool(kNewLanguage) == null) {
      Intl.systemLocale;
      return Locale(Intl.systemLocale);
    } else if (Prefs.getBool(kNewLanguage) == false) {
      Prefs.setBool(kNewLanguage, false);
      return Locale('en', 'US');
    } else if (Prefs.getBool(kNewLanguage) == true) {
      Prefs.setBool(kNewLanguage, true);
      return Locale('ar', 'EG');
    }

    return Locale(Intl.systemLocale);
  }
}
