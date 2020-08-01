import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hope/utils/appRepository.dart';
import 'package:hope/utils/appColors.dart';
import 'package:hope/utils/appThemes.dart';
import 'package:hope/utils/strings.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter,
        colors: [AppColors.gradientGreen, AppColors.gradientBlue],
              ),
            ),
          child: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.fromLTRB(48.0, 130.0, 48.0, 220.0),
                child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(18.0),
              border: Border.all(
                color: AppColors.colorWhite,
                width: 2.0,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16.0, 1.0, 16.0, 1.0),
            child: Text(
              appName,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 32.0,
                  color: AppColors.colorWhite,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              appTag,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 8.0,
                  color: AppColors.colorWhite,
                  fontWeight: FontWeight.w100,
                  decoration: TextDecoration.none),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0),
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.colorWhite,
                borderRadius: BorderRadius.circular(9.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorDarkerGrey,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 6.0,
                  ),
                ]),
            child: Column(
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.fromLTRB(4.0, 16.0, 4.0, 4.0),
                  child: Text(
                    register,
                    style: appThemeData.textTheme.subtitle1,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(2.0),
                  child: Text(
                    registerTag,
                    style: appThemeData.textTheme.caption,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16.0, 32.0, 8.0, 16.0),
                  child: RegistrationForm(),
                ),
              ],
            ),
          )
        ],
                ),
              ),
          ),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  RegistrationFormState createState() => RegistrationFormState();
}

class RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String contact;
  String verificationId;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Name text field
            TextFormField(
              decoration: InputDecoration(
                  labelText: name,
                  contentPadding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 0.0),
                  labelStyle: appThemeData.textTheme.subtitle2),
              autovalidate: true,
              keyboardType: TextInputType.text,
            ),

            //Contact number text field
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: contact,
                  contentPadding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 0.0),
                  labelStyle: appThemeData.textTheme.subtitle2,
                ),
                autovalidate: true,
                keyboardType: TextInputType.phone,
                onChanged: (number) {
                  setState(() {
                    this.contact = number;
                  });
                },
              ),
            ),

            //Create Account Button
            InkWell(
              onTap: () async {
                final repo = Provider.of<AppRepository>(context);
                  repo.auth.verifyPhoneNumber(
                  phoneNumber: '+91$contact',
                  timeout: const Duration(seconds: 30),
                  verificationCompleted: (AuthCredential authCredential){
                    repo.signIn(authCredential);
                    Navigator.of(context).pushReplacementNamed('/language');
                  },
                  verificationFailed: (AuthException e) { print('${e.message}');},
                  codeSent: (String verId, [int forceCodeResend]) {
                    setState(() {
                      verificationId = verId;
                    });
                  },
                  codeAutoRetrievalTimeout: (String verId) {
                    setState(() {
                      verificationId = verId;
                    });
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.centerStart,
                        end: AlignmentDirectional.centerEnd,
                        colors: [
                          AppColors.gradientBlue,
                          AppColors.gradientGreen
                        ])),
                child: Text(
                  createAccount,
                  style: buttonThemeData.textTheme.headline1,
                ),
              ),
            )
          ],
        ));
  }
}
