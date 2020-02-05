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
        onTap: () {
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
                        child: artical.urlToImage == null ||
                                artical.urlToImage.isEmpty
                            ? Container()
                            : customImage(artical.urlToImage,
                                fit: BoxFit.cover)),
                  )),
              SizedBox(width: 10),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(),
                  Container(
                    height: 52,
                    child: Text(
                      artical.title,
                      style: AppTheme.titleStyle,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          bloc.getGategory,
                          style: AppTheme.h6Style.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(artical.getDateOnly(),
                            style: AppTheme.subTitleStyle),
                      ),
                    ],
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
