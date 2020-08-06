import 'package:flutter/cupertino.dart';
import 'package:hope/utils/appColors.dart';
import 'package:hope/utils/strings.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [AppColors.gradientGreen, AppColors.gradientBlue],
        ),
      ),
      child: Center(
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
                    fontSize: 57.0,
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
                    fontSize: 11.0,
                    color: AppColors.colorWhite,
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
