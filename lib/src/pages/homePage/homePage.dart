import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/blocks/newsBloc.dart';
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
  Widget _headerNews() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Hero(tag: 'headerImage', 
          child: customImage('https://www.channelnomics.com/wp-content/uploads/2019/04/surface-Hub-2s-770x515.jpg'),
        ),
        Container(
          padding: EdgeInsets.only(left: 30, right: 40, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Managing your workspace to more comfort',
                  style: AppTheme.h1Style
                      .copyWith(color: Theme.of(context).backgroundColor)),
              Text('17 December 2019',
                  style: AppTheme.subTitleStyle
                      .copyWith(color: Theme.of(context).backgroundColor))
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: 0,
        fixedColor: Theme.of(context).primaryColorLight,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.search),title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow),title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.person),title: Text('Home')),
        ],
        elevation: 5,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              centerTitle: true,
              title: Text('NEWS',style: AppTheme.h2Style.copyWith(color:Theme.of(context).colorScheme.primaryVariant),),
              backgroundColor: Theme.of(context).backgroundColor,
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: _headerNews(),
            ),
            StreamBuilder(
              stream: bloc.allNews,
              builder: (context,  AsyncSnapshot<List<Article>> snapshot) => SliverList(
               delegate: SliverChildBuilderDelegate(
                  (context, index) => NewsCard(artical: snapshot.data[index]),
                  childCount: snapshot.hasData ? snapshot.data.length : 0,
               )
              )
            )
          ],
        ),
      )
    );
  }
}
