import 'package:flutter/material.dart';
import 'package:hope/description/screenArguments.dart';
import 'package:hope/utils/appColors.dart';
import 'package:hope/utils/appRepository.dart';
import 'package:hope/utils/appThemes.dart';
import 'package:hope/utils/sharedPreferences.dart';
import 'package:provider/provider.dart';

class InfoTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    final repo = Provider.of<AppRepository>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.colorAppBar,
          leading: Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.colorWhite,
              ),
              onPressed: () {
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
        body: StreamBuilder(
            stream: repo.firestore
                .collection(repo.prefs.getString(PrefKeys.language))
                .document(args.title)
                .collection('Info')
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
                      margin: EdgeInsets.only(top: 48.0),
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 2.0, crossAxisCount: 2),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                Navigator.pushNamed(context,
                                    '/${snapshot.data.documents[index].documentID}',
                                    arguments: ScreenArguments(args.title));
                              },
                              child: _GridListTile(
                                category:
                                    snapshot.data.documents[index].documentID,
                                index: index,
                              ),
                            );
                          }));
              }
            }));
  }
}

class _GridListTile extends StatelessWidget {
  _GridListTile({
    @required this.category,
    @required this.index,
    Key key,
  }) : super(key: key);

  final String category;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.infoColors[index],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(9.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorShadow,
            offset: Offset(0.0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Container(
        alignment: AlignmentDirectional.bottomStart,
        margin: EdgeInsets.only(left: 12.0, bottom: 16.0, right: 12.0),
        child: Text(
          category,
          style: categoryThemeData.textTheme.headline2,
        ),
      ),
    );
  }
}
