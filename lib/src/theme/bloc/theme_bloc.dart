import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/theme/bloc/theme_event.dart';
import 'package:flutter_news_app/src/theme/bloc/theme_state.dart';

import '../theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => SelectedTheme(themeType: ThemeType.Light);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is LightMode) {
      yield SelectedTheme(themeType: ThemeType.Light);
    } else {
      yield SelectedTheme(themeType: ThemeType.Dark);
    }
  }
}
