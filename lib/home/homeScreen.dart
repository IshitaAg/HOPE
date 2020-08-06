import 'package:flutter/material.dart';
import 'package:hope/description/infoTypeScreen.dart';
import 'package:hope/description/screenArguments.dart';
import 'package:hope/utils/appColors.dart';
import 'package:hope/utils/appRepository.dart';
import 'package:hope/utils/appThemes.dart';
import 'package:hope/utils/sharedPreferences.dart';
import 'package:hope/utils/strings.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';

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
          stream: repo.firestore.collection(repo.prefs.getString(PrefKeys.language)).snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        String category =
                            snapshot.data.documents[index].documentID;
                        if (repo.prefs.getString(repo.prefs.getString(PrefKeys.language)) == 'English') {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/info',
                                  arguments: ScreenArguments(category,snapshot.data.documents[index]['name'],'info'));
                            },
                            child: _ListTile(categoryName: category,image: category,),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/info',
                                  arguments: ScreenArguments(category,snapshot.data.documents[index]['name'],'info'));
                            },
                            child: _ListTile(categoryName: category,image: snapshot.data.documents[index]['name'],),
                          );
                        }
                      }),
                );
            }
          }),
    );
  }
}

class _ListTile extends StatelessWidget {
  _ListTile({
    @required this.categoryName,
    @required this.image,
    Key key,
  }) : super(key: key);

  final String categoryName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 8.0),
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
            'assets/images/$image.png',
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
