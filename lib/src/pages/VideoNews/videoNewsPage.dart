import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/blocks/newsBloc.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:flutter_news_app/src/pages/homePage/widget/newsCard.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

class VideoNewsPage extends StatefulWidget {
  @override
  _VideoNewsPageState createState() => _VideoNewsPageState();
}

class _VideoNewsPageState extends State<VideoNewsPage> {
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
        child: Container(
            margin: EdgeInsets.only(left:20,right: 20,bottom:30),
            width: MediaQuery.of(context).size.width * 6,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Hero(
                      tag: 'headerImage',
                      child:
                          customImage(article.urlToImage, fit: BoxFit.cover),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 10, bottom: 20),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(article.title,
                              style: AppTheme.h2Style.copyWith(
                                  color: Theme.of(context).backgroundColor)),
                          Text(article.getTime(),
                              style: AppTheme.subTitleStyle.copyWith(
                                  color: Theme.of(context).backgroundColor))
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: _playWidget(context),
                        ))
                  ],
                ))));
  }

  Widget _playWidget(BuildContext context) {
    return SizedBox(
        height: 25,
        child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).backgroundColor),
                child: Icon(
                  Icons.play_arrow,
                  color: Theme.of(context).disabledColor,
                  size: 25,
                ))));
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
                            : AspectRatio(
                              aspectRatio: 16/9,
                              child:PageView.builder(
                                
                              itemBuilder: (context,index){
                                return _headerNews(snapshot.data[index]);
                              },
                              itemCount: 5,
                              )
                            )
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
                        (context, index) => NewsCard(
                          artical: snapshot.data[index],
                          isVideoNews: true,
                        ),
                        childCount: snapshot.hasData ? snapshot.data.length : 0,
                      )))
            ],
          ),
        ));
  }
}
