import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:flutter_news_app/src/pages/homePage/bloc/bloc.dart';
import 'package:flutter_news_app/src/pages/homePage/widget/newsCard.dart';
import 'package:flutter_news_app/src/pages/newsDetail/bloc/bloc.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

class VideoNewsPage extends StatelessWidget {
  Widget _headerNews(BuildContext context, Article article) {
    return InkWell(
        onTap: () {
          BlocProvider.of<DetailBloc>(context)
              .add(SelectNewsForDetail(article: article));
          Navigator.pushNamed(context, '/detail');
        },
        child: Container(
            width: MediaQuery.of(context).size.width * 6,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    article.urlToImage == null
                        ? Container()
                        : customImage(article.urlToImage, fit: BoxFit.fitWidth),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 10, bottom: 20),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(article.title,
                              style: AppTheme.h2Style.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface)),
                          Text(article.getTime(),
                              style: AppTheme.subTitleStyle.copyWith(
                                  color: Theme.of(context).disabledColor))
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
                    color: Theme.of(context).bottomAppBarColor),
                child: Icon(
                  Icons.play_arrow,
                  color: Theme.of(context).disabledColor,
                  size: 25,
                ))));
  }

  Widget _body(
    BuildContext context,
    List<Article> list, {
    String type,
  }) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text(
            '${type.toUpperCase()} NEWS',
            style: AppTheme.h2Style
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          backgroundColor: Theme.of(context).bottomAppBarColor,
          pinned: true,
        ),
        SliverToBoxAdapter(
            child: AspectRatio(
                aspectRatio: 16 / 9,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return _headerNews(context, list[index]);
                  },
                  itemCount: 5,
                ))),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => NewsCard(
                      artical: list[index],
                      isVideoNews: true,
                      type: type.toUpperCase(),
                    ),
                childCount: list.length)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
            child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
          if (state == null) {
            return Center(child: Text('Null block'));
          }
          if (state is Failure) {
            return Center(child: Text('Something went wrong'));
          }
          if (state is Loaded) {
            if (state.items == null || state.items.isEmpty) {
              return Text('No content avilable');
            } else {
              return _body(context, state.items, type: state.type);
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        })));
  }
}
