import 'package:flutter/material.dart';
import 'package:hope/description/screenArguments.dart';
import 'package:hope/utils/appColors.dart';
import 'package:hope/utils/appRepository.dart';
import 'package:hope/utils/appThemes.dart';
import 'package:hope/utils/sharedPreferences.dart';
import 'package:hope/utils/strings.dart';
import 'package:provider/provider.dart';

class HelplineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    final repo = Provider.of<AppRepository>(context);
    return Scaffold(
      backgroundColor: AppColors.colorAppBar,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          helpline.toUpperCase(),
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
      body: StreamBuilder(
        stream: repo.firestore
            .collection(repo.prefs.getString(PrefKeys.language))
            .document(args.title)
            .collection('Info')
            .document(helpline)
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
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorWhite,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.colorDarkerGrey,
                      offset: Offset(0.0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      margin: const EdgeInsets.only(top:8.0,bottom:8.0),
                      child: Image.asset(
                        'assets/images/info.png',
                        height: 150.0,
                        width: 170.0,
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.center,
                      margin: EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data.documents[0].documentID,
                        style: infoThemeData.textTheme.subtitle2,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data.documents[0]['no'],
                            style: infoThemeData.textTheme.subtitle2,
                          ),
                        ),

                        Image.asset(
                          'assets/images/helpline.png',
                          height: 32.0,
                          width: 32.0,
                        )
                      ],
                    )
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
