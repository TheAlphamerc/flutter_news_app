import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:flutter_news_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'newsEvent.dart';
import 'newsState.dart';
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final  Repository repository;
  ValueNotifier selectedPage = ValueNotifier(0);

  NewsBloc({this.repository});

  String _selectedCategory = 'General';

  set setCagegory(String type) {
    _selectedCategory = type;
  }

  String get getGategory => _selectedCategory;

  @override
  
  NewsState get initialState => Loading();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event)async* {
    if(event is Fetch){
      try {
        final items = await repository.fetchAllNews();
        yield Loaded(items: items);
      } catch (_) {
        yield Failure();
      }
    }
  }
}

