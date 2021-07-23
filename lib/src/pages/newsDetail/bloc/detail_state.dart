import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class LoadingDetail extends DetailState {}

class FailureDetail extends DetailState {}

class LoadedArticle extends DetailState {
  final Article selectedArticle;

  LoadedArticle({this.selectedArticle});

  @override
  List<Object> get props => [selectedArticle];

  @override
  String toString() => 'LoadedArticle { items: ${selectedArticle.source} }';
}
