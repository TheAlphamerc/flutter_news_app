import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:flutter_news_app/src/pages/homePage/bloc/bloc.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

import 'bloc/bloc.dart';

class NewsDetailPage extends StatelessWidget {
  Widget _headerNews(BuildContext context, Article article) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Hero(
          tag: 'headerImage',
          child: article.urlToImage == null || article.urlToImage.isEmpty
              ? Container()
              : customImage(article.urlToImage),
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

  Widget _body(BuildContext context, Article article) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _headerNews(context, article),
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
              Text(article.content ?? '', style: AppTheme.h4Style)
            ],
          ),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state == null) {
              return Center(child: Text('Null bloc'));
            }
            if (state is Failure) {
              return Center(child: Text('Something went wrong'));
            }
            if (state is LoadedArticle) {
              if (state.selectedArticle == null) {
                return Text('No content avilable');
              } else {
                return _body(
                  context,
                  state.selectedArticle,
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )));
  }
}
