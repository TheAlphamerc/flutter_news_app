import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/commonWidget/bottomNavigationBar.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/helpers/constants.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:flutter_news_app/src/theme/theme.dart';
import 'package:flutter_news_app/src/blocks/newsBloc.dart';

class NewsDetailPage extends StatefulWidget {
  NewsDetailPage({Key key}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  Article article;
  @override
  void initState() {
    article = bloc.selectedNews;
    super.initState();
  }

  Widget _headerNews() {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Hero(
          tag: 'headerImage',
          child: customImage(article.urlToImage),
        ),
        Container(
          padding: EdgeInsets.only(left: 0, right: 10, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Theme.of(context).backgroundColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _headerNews(),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(article.title, style: AppTheme.h1Style),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(article.author ?? '', style: AppTheme.h6Style),
                    SizedBox(
                      width: 10,
                    ),
                    Text(article.getTime(), style: AppTheme.h6Style),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                ),
                Text(article.content ?? '', style: AppTheme.h6Style)
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
