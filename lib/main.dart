import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hope/splash/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/languageScreen.dart';
import 'auth/registerScreen.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();

  runZoned(() async{
    
    final prefs = await SharedPreferences.getInstance();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
   
    runApp(InfoApp());
  },
  );
  
}

class InfoApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LanguageScreen(),
    );
  }
}


