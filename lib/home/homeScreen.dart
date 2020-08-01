import 'package:flutter/material.dart';
import 'package:hope/utils/appColors.dart';
import 'package:hope/utils/appRepository.dart';
import 'package:hope/utils/appThemes.dart';
import 'package:hope/utils/sharedPreferences.dart';
import 'package:hope/utils/strings.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<AppRepository>(context);
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
              onPressed: () async {
                //TODO: open developers page
              }),
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () async {
                //TODO: open a dialog box
              })
        ],
      ),
      body: StreamBuilder(
          stream:
              repo.firestore.collection(sharedPreferences.language).snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return Container(
                  margin: EdgeInsets.only(top:16.0),
                  child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            categoryName: snapshot.data.documents[index]['name']);
                      }),
                );
            }
          }),
    );
  }
}

class ListTile extends StatelessWidget {
  ListTile({
    @required this.categoryName,
    Key key,
  }) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12.0,4.0,4.0,12.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorShadow,
            offset: Offset(0.0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/$categoryName.png',
            height: 60.0,
            width: 60.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            categoryName,
            style: categoryThemeData.textTheme.headline1,
          ),
        )
      ]),
    );
  }
}
