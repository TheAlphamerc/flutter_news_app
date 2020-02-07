import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';

import 'detail_event.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<NewsDetailEvent,DetailState>{
  @override
  DetailState get initialState => LoadingDetail();

  @override
  Stream<DetailState> mapEventToState(NewsDetailEvent event)async* {
    if(event is SelectNewsForDetail){
      try {
        yield LoadedArticle(selectedArticle: event.article);
      } catch (_) {
        yield FailureDetail();
      }
    }
  }
}