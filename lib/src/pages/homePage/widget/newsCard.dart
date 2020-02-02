import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
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
                          'https://techcrunch.com/wp-content/uploads/2020/01/GettyImages-957211010.jpg?w=600',
                          fit: BoxFit.cover)),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * .64,
                  child: Text('Managing your workspace to more comfort',
                      style: AppTheme.titleStyle),
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
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text('17 Jan 2020', style: AppTheme.subTitleStyle),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
