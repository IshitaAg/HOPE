import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hope/auth/languageScreen.dart';
import 'package:hope/auth/registerScreen.dart';
import 'package:hope/auth/splashScreen.dart';
import 'package:hope/home/homeScreen.dart';
import 'package:hope/utils/sharedPreferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

import 'appColors.dart';

class AppRepository {
  AppRepository(
      {@required SharedPreferences sharedPreferences,
      @required FirebaseAuth firebaseAuth,
      @required Firestore firestore})
      : this.prefs = sharedPreferences,
        this.auth = firebaseAuth,
        this.firestore = firestore;

  final SharedPreferences prefs;
  final FirebaseAuth auth;
  final Firestore firestore;

  //checks if the user is already logged-in or not
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return SplashScreen();
          default:
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return RegisterScreen();
            }
        }
      },
    );
  }

  //Login
  signIn(AuthCredential authCredential) {
    FirebaseAuth.instance.signInWithCredential(authCredential);
  }

  //set language for the whole application
  setLanguage(String lang) async {
    await prefs.setString(PrefKeys.language, lang);
  }

}
