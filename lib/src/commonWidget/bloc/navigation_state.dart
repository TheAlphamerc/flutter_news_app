import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';

abstract class NavigationState extends Equatable{
  const NavigationState();

  @override
  List<Object> get props => [];
}


class Opened extends NavigationState {
  final int pageIndex;

  Opened({this.pageIndex});

  @override
  List<Object> get props => [pageIndex];

  @override
  String toString() => 'Page Opened { items: $pageIndex }';

}
