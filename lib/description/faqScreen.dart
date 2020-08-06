import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:hope/description/faq.dart';
import 'package:hope/description/screenArguments.dart';
import 'package:hope/utils/appColors.dart';
import 'package:hope/utils/appRepository.dart';
import 'package:hope/utils/appThemes.dart';
import 'package:hope/utils/sharedPreferences.dart';
import 'package:hope/utils/strings.dart';
import 'package:provider/provider.dart';

class FaqScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    final repo = Provider.of<AppRepository>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorAppBar,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          faq,
          style: categoryThemeData.textTheme.subtitle1,
        ),
      ),
      body: StreamBuilder(
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
                  margin: EdgeInsets.all(16.0),
                  child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return _FaqTile(
                            faq: FAQ(
                                body: snapshot.data.documents[index]['A'],
                                header: snapshot.data.documents[index]['Q']));
                      }),
                );
            }
          }),
    );
  }
}

class _FaqTile extends StatelessWidget {
  _FaqTile({
    @required this.faq,
    Key key,
  }) : super(key: key);

  final FAQ faq;

  @override
  Widget build(BuildContext context) {
    return ConfigurableExpansionTile(
      header: Flexible(
        child: Container(
          constraints:
              BoxConstraints.tightFor(width: MediaQuery.of(context).size.width),
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 8.0),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      ques,
                      softWrap: true,
                      style: TextStyle(
                          color: AppColors.colorAppBar,
                          fontFamily: 'Nunito Sans',
                          fontSize: 34.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.34),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      faq.header,
                      softWrap: true,
                      style: TextStyle(
                          color: AppColors.colorAppBar,
                          fontFamily: 'Nunito Sans',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.75),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,16.0,8.0,8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(19.0),
                  child: Divider(
                    color: AppColors.colorDarkerGrey,
                    height: 3.0,
                    thickness: 3.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      headerExpanded: Flexible(
        child: Container(
          constraints:
              BoxConstraints.tightFor(width: MediaQuery.of(context).size.width),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          decoration: BoxDecoration(
              color: AppColors.colorAppBar,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28.0),
                  topRight: Radius.circular(28.0))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8.0),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  ques,
                  style: TextStyle(
                      color: AppColors.colorWhite,
                      fontFamily: 'Nunito Sans',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.75),
                ),
              ),
              Expanded(
                child: Text(
                  faq.header,
                  softWrap: true,
                  style: TextStyle(
                      color: AppColors.colorWhite,
                      fontFamily: 'Nunito Sans',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.75),
                ),
              ),
            ],
          ),
        ),
      ),
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: AppColors.colorAppBar,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28.0),
                  bottomRight: Radius.circular(28.0))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8.0),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  ans,
                  style: TextStyle(
                      color: AppColors.colorWhite,
                      fontFamily: 'Nunito Sans',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.75),
                ),
              ),
              Expanded(
                child: Text(
                  faq.body,
                  style: TextStyle(
                      color: AppColors.colorWhite,
                      fontFamily: 'Nunito Sans',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.75),
                ),
              ),
            ],
          ),
        ),
         Padding(
                padding: const EdgeInsets.fromLTRB(8.0,16.0,8.0,8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(19.0),
                  child: Divider(
                    color: AppColors.colorDarkerGrey,
                    height: 3.0,
                    thickness: 3.0,
                  ),
                ),
              ),
      ],
    );
  }
}
