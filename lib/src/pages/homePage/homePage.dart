import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/blocks/newsBloc.dart';
import 'package:flutter_news_app/src/commonWidget/bottomNavigationBar.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:flutter_news_app/src/theme/theme.dart';
import 'widget/newsCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    bloc.fetchAllNews();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  Widget _headerNews(Article article) {
    return InkWell(
        onTap: () {
          bloc.setNews = article;
          Navigator.pushNamed(context, '/detail');
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Hero(
              tag: 'headerImage',
              child: customImage(article.urlToImage),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(article.title,
                      style: AppTheme.h1Style
                          .copyWith(color: Theme.of(context).backgroundColor)),
                  Text(article.getTime(),
                      style: AppTheme.subTitleStyle
                          .copyWith(color: Theme.of(context).backgroundColor))
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                centerTitle: true,
                title: Text(
                  'NEWS',
                  style: AppTheme.h2Style.copyWith(
                      color: Theme.of(context).colorScheme.primaryVariant),
                ),
                backgroundColor: Theme.of(context).backgroundColor,
                pinned: true,
              ),
              StreamBuilder(
                  stream: bloc.allNews,
                  builder: (context, AsyncSnapshot<List<Article>> snapshot) {
                    if (snapshot.hasData) {
                      return SliverToBoxAdapter(
                        child: snapshot.data.length == 0
                            ? Container()
                            : _headerNews(snapshot.data.first),
                      );
                    } else {
                      return SliverToBoxAdapter(
                          child: Container(
                        height: MediaQuery.of(context).size.height - 100,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ));
                    }
                  }),
              StreamBuilder(
                  stream: bloc.allNews,
                  builder: (context, AsyncSnapshot<List<Article>> snapshot) =>
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            NewsCard(artical: snapshot.data[index]),
                        childCount: snapshot.hasData ? snapshot.data.length : 0,
                      )))
            ],
          ),
        ));
  }
}
