import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:flutter_news_app/src/theme/theme.dart';
import 'package:flutter_news_app/src/blocks/newsBloc.dart';

class NewsCard extends StatelessWidget {
  final Article artical;
  const NewsCard({Key key, this.artical}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        bloc.setNews = artical;
        Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                      color: Theme.of(context).primaryColor,
                      child: customImage(
                          artical.urlToImage,
                          fit: BoxFit.cover)),
                )),
            SizedBox(width:10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(),
                  Container(
                    height: 52,
                    child: Text(artical.title,
                      style: AppTheme.titleStyle,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Chip(
                        label: Text(
                          'Tip',
                        ),
                        labelStyle: AppTheme.h6Style.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('17 Jan 2020', style: AppTheme.subTitleStyle),
                      ),
                    ],
                  )
                ],
              )
            )
          ],
        ),
      )
    );
  }
}
