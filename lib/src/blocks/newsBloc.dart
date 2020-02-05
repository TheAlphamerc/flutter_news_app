import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:flutter_news_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final _repository = Repository();
  final _newsListFetcher = PublishSubject<List<Article>>();
  var _selectedrticle = Article();
  ValueNotifier selectedPage = ValueNotifier(0);

  Stream<List<Article>> get allNews => _newsListFetcher.stream;
  Article get selectedNews => _selectedrticle;
  String _selectedCategory = 'General';

  fetchAllNews() async {
    List<Article> itemModel =
        await _repository.fetchAllNews(category: _selectedCategory);
    _newsListFetcher.sink.add(itemModel);
  }

  set setNews(Article article) {
    _selectedrticle = article;
  }

  set setSelectedPage(int index) {
    selectedPage.value = index;
  }

  set setCagegory(String type) {
    _selectedCategory = type;
  }

  String get getGategory => _selectedCategory;
  dispose() {
    // _newsListFetcher.close();
  }
}

final bloc = NewsBloc();
