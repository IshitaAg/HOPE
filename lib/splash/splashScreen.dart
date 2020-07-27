import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hope/utils/appColors.dart';
import 'package:hope/utils/appThemes.dart';
import 'package:hope/utils/strings.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: AlignmentDirectional.bottomEnd,
            colors: [AppColors.gradientBlue,AppColors.gradientGreen]
          ),
        ),
        child: Center(
          child:Container(
      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                   decoration: BoxDecoration(
                     shape: BoxShape.rectangle,
                     borderRadius: BorderRadius.circular(18.0),
                     border: Border.all(
                       color:  AppColors.colorWhite,
                       width: 3.0,
                     )
                   ),
                   child: Padding(
                     padding: const EdgeInsets.fromLTRB(16.0, 1.0, 16.0, 1.0),
                     child: Text(
                       appName,
                       style: appThemeData.textTheme.headline1,
                       ),
                   ),
                 ),

                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                       appTag,
                       style: appThemeData.textTheme.headline2,
                       ),
                 )
              ],
            ),
    ),
        ),
      ),
    );
  }
}
