import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hope/utils/appColors.dart';
import 'package:hope/utils/appThemes.dart';
import 'package:hope/utils/strings.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [AppColors.gradientGreen, AppColors.gradientBlue],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(32.0, 130.0, 32.0, 350.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Following two widgets make the logo
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

              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0),
                  decoration: BoxDecoration(
                    color: AppColors.colorWhite,
                    borderRadius: BorderRadius.circular(9.0),
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorDarkerGrey,
                        offset: Offset(0.0, 3.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(4.0, 24.0, 4.0, 4.0),
                        child: Text(
                          chooseLang,
                          style: appThemeData.textTheme.subtitle1,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(2.0),
                        child: Text(
                          chooseLangTag,
                          style: appThemeData.textTheme.caption,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 24.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              //Hindi option
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    //set language in shared preferences as Eng and head to home screen
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 32.0, bottom: 32.0, right: 16.0),
                                    decoration: BoxDecoration(
                                      color: AppColors.colorBlue,
                                      borderRadius: BorderRadius.circular(5.0),
                                      shape: BoxShape.rectangle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.colorDarkerGrey,
                                          offset: Offset(0.0, 3.0),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          alignment:
                                              AlignmentDirectional.centerStart,
                                          margin: EdgeInsets.fromLTRB(
                                              16.0, 16.0, 4.0, 4.0),
                                          child: Text(
                                            hindi,
                                            style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 12.0,
                                                color: AppColors.colorWhite,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            letterHindi,
                                            style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 45.0,
                                                color: AppColors.colorWhite,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              //English option
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    //set language in shared preferences as Eng and head to home screen
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 16.0, bottom: 32.0, right: 32.0),
                                    decoration: BoxDecoration(
                                      color: AppColors.colorGreen,
                                      borderRadius: BorderRadius.circular(5.0),
                                      shape: BoxShape.rectangle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.colorDarkerGrey,
                                          offset: Offset(0.0, 3.0),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          alignment:
                                              AlignmentDirectional.centerStart,
                                          margin: EdgeInsets.fromLTRB(
                                              16.0, 12.0, 4.0, 4.0),
                                          child: Text(
                                            english,
                                            style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 12.0,
                                                color: AppColors.colorWhite,
                                                fontWeight: FontWeight.w800,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            letterEnglish,
                                            style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 41.0,
                                                color: AppColors.colorWhite,
                                                fontWeight: FontWeight.w800,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
