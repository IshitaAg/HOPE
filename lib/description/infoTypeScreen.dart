import 'package:flutter/material.dart';
import 'package:hope/description/screenArguments.dart';
import 'package:hope/utils/appColors.dart';
import 'package:hope/utils/appThemes.dart';

class InfoTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorAppBar,
        leading: Padding(
          padding: EdgeInsets.only(left:12.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back,color: AppColors.colorWhite,),
            onPressed: (){
                Navigator.pop(context);
            },
          ),
        ),
        centerTitle: true,
        title: Text(
          args.title,
          style: categoryThemeData.textTheme.subtitle1,
        ),
      ),
      body: Container(
        child: Center(),
      ),
    );
  }
}


