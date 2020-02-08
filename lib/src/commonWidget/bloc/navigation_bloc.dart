import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/commonWidget/bloc/navigation_event.dart';

import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState>{
  @override
  
  NavigationState get initialState => Opened(pageIndex: 0);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event)async* {
    
    if(event is Navigate){
       yield Opened(pageIndex: event.pageIndex);
    }
  }
}