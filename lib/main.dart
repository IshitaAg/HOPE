import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hope/utils/appRepository.dart';
import 'package:hope/home/homeScreen.dart';
import 'package:hope/utils/appThemes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/languageScreen.dart';
import 'auth/registerScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Crashlytics.instance.enableInDevMode = false;
  //FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runZoned(() async {
    final prefs = await SharedPreferences.getInstance();
    final analytics = FirebaseAnalytics();
    final auth = FirebaseAuth.instance;
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final appRepository = AppRepository(sharedPreferences: prefs,firebaseAuth: auth);
    runApp(InfoApp(
      auth: auth,
      analytics: analytics,
      appRepository: appRepository,
    ));
  },/* onError: Crashlytics.instance.recordError*/);
}

class InfoApp extends StatelessWidget {
  InfoApp({
    @required this.auth,
    @required this.analytics,
    @required this.appRepository,
    Key key,
  }) : super(key: key);

  final FirebaseAuth auth;
  final FirebaseAnalytics analytics;
  final AppRepository appRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HOPE',
      home: Provider.value(value: appRepository,child: HomeScreen() /*authRepository.handleAuth()*/,),
      routes: {
        '/home':(context){
          return HomeScreen();
        },
        '/language': (context) {
          return Provider.value(value: appRepository,child: LanguageScreen(),);
        },
        '/register': (context) {
          return Provider.value(value: appRepository,child: RegisterScreen(),);
        }
      },
      navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
    );
  }
}
