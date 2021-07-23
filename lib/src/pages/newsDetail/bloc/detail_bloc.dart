import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_event.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<NewsDetailEvent, DetailState> {
  DetailBloc() : super(LoadingDetail());

  @override
  Stream<DetailState> mapEventToState(NewsDetailEvent event) async* {
    if (event is SelectNewsForDetail) {
      try {
        yield LoadedArticle(selectedArticle: event.article);
      } catch (_) {
        yield FailureDetail();
      }
    }
  }
}
