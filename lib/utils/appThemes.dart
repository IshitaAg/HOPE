import 'package:flutter/material.dart';
import 'package:hope/utils/appColors.dart';

final appThemeData = ThemeData(
  textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 57.0,
        color: AppColors.colorWhite,
      ),
      headline2: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 11.0,
        color: AppColors.colorWhite,
      ),
      subtitle1: TextStyle(
        fontFamily: 'Nunito Sans',
        fontSize: 22.0,
        color: AppColors.colorBlack,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.0,
      ),
      caption: TextStyle(
          fontFamily: 'Nunito Sans',
          fontSize: 14.0,
          color: AppColors.colorGrey,
          letterSpacing: 0.14,
          fontWeight: FontWeight.w400),
      subtitle2: TextStyle(
        fontFamily: 'Nunito Sans',
        fontSize: 12.0,
        color: AppColors.colorDarkerGrey,
        letterSpacing: 0.1,
      )),
);

final buttonThemeData = ThemeData(textTheme: TextTheme(
  headline1: TextStyle(
    fontFamily: 'Nunito Sans',
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    color: AppColors.colorWhite,
    letterSpacing: 3.0,

  ),
));

final categoryThemeData = ThemeData(textTheme: TextTheme(
  headline1: TextStyle(
    fontFamily: 'Nunito Sans',
    fontSize: 14.0,
    letterSpacing: 0.7,
    color: AppColors.colorBlack,
    fontWeight: FontWeight.w900
  ),

  subtitle1: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 13.0,
    letterSpacing: 1.3,
    fontWeight: FontWeight.w600,
    color: AppColors.colorWhite
  ),
  headline2: TextStyle(
    fontFamily: 'Montserrat',
    color: AppColors.colorWhite,
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
    letterSpacing: 1.3,
    
  )
));
