import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/commonWidget/bloc/bloc.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final PageController controller;
  const BottomNavigationBarWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if(state is Opened){
             return  BottomNavigationBar(
              showUnselectedLabels: false,
              showSelectedLabels: false,
              currentIndex: state.pageIndex,
              fixedColor: Theme.of(context).primaryColorLight,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Theme.of(context).primaryColor,
              onTap: (pageIndex) {
                
                 final detailBloc = BlocProvider.of<NavigationBloc>(context);
                 detailBloc.add(Navigate(pageIndex: pageIndex));

                controller.animateToPage(pageIndex,
                    duration: Duration(milliseconds: 300), curve: Curves.linear);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), title: Text('Home')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.play_arrow), title: Text('Home')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), title: Text('Home')),
              ],
              elevation: 5,
            );}
    });
  }
}
