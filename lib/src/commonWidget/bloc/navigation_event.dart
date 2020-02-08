
import 'package:equatable/equatable.dart';

class NavigationEvent extends Equatable{

  const NavigationEvent();

  @override
  List<Object> get props => [];
}


class Navigate extends NavigationEvent {
  final int pageIndex;

  Navigate({this.pageIndex});

  @override
  List<Object> get props => [pageIndex];
}
