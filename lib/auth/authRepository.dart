import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hope/auth/registerScreen.dart';
import 'package:hope/home/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository{
   
  /* AuthRepository({
     @required SharedPreferences sharedPreferences,
     @required FirebaseAuth firebaseAuth
   }) : this.prefs = sharedPreferences,
        this.auth=firebaseAuth;

  final SharedPreferences prefs;
  final FirebaseAuth auth;*/

  //checks if the user is already logged-in or not
  handleAuth(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context,snapshot){
        if(snapshot.hasData){
          return HomeScreen();
        }
        else{
          return RegisterScreen();
        }
      },
    );
  }
  
  //Login 
  signIn(AuthCredential authCredential){

       FirebaseAuth.instance.signInWithCredential(authCredential);
  }

}