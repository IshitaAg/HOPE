import 'package:flutter/material.dart';
import 'package:hope/description/screenArguments.dart';
import 'package:hope/utils/appColors.dart';
import 'package:hope/utils/appRepository.dart';
import 'package:hope/utils/sharedPreferences.dart';
import 'package:hope/utils/strings.dart';
import 'package:provider/provider.dart';
import 'package:hope/utils/appThemes.dart';

class BasicInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    final repo = Provider.of<AppRepository>(context);
    return Scaffold(
      backgroundColor: AppColors.colorAppBar,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          args.title,
          style: categoryThemeData.textTheme.subtitle1,
        ),
        elevation: 0.0,
        backgroundColor: AppColors.colorAppBar,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .15),
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(36.0),
                  topEnd: Radius.circular(36.0)),
            ),
            child: StreamBuilder(
                stream: repo.firestore
                    .collection(repo.prefs.getString(PrefKeys.language))
                    .document(args.title)
                    .collection('Info')
                    .document(args.type)
                    .collection('Details')
                    .snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      return Container(
                        margin: EdgeInsets.fromLTRB(16.0, 80.0, 8.0, 8.0),
                        child: ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    alignment: AlignmentDirectional.topStart,
                                    padding: const EdgeInsets.fromLTRB(
                                        24.0, 16.0, 24.0, 16.0),
                                    child: Text(
                                      snapshot.data.documents[index].documentID
                                          .toString()
                                          .toUpperCase(),
                                      style: infoThemeData.textTheme.headline1,
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      alignment: AlignmentDirectional.topStart,
                                      padding: const EdgeInsets.fromLTRB(
                                          24.0, 16.0, 24.0, 16.0),
                                      child: Text(
                                        snapshot.data.documents[index]['f'],
                                        style:
                                            infoThemeData.textTheme.subtitle1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(19.0),
                                      child: Divider(
                                        color: AppColors.colorGrey,
                                        height: 3.0,
                                        thickness: 3.0,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                      );
                  }
                }),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .04),
            alignment: AlignmentDirectional.topCenter,
            child: Image.asset(
              'assets/images/${args.titleHindi}.png',
              height: 160.0,
              width: 160.0,
            ),
          ),
        ],
      ),
    );
  }
}
