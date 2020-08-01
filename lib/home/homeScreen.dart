import 'package:flutter/material.dart';
import 'package:hope/utils/appColors.dart';
import 'package:hope/utils/strings.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorAppBar,
        title: Text(
          appName,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 26.0,
              color: AppColors.colorWhite,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person), 
            onPressed: ()async{
              //TODO: open developers page
            }),
          IconButton(
            icon: Icon(Icons.info),
             onPressed: ()async{
               //TODO: open a dialog box
             })
        ],
      ),
      body: Container(
        color: AppColors.colorWhite,
        child: Center(
          
        ),
      ),
    );
  }
}
