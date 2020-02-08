import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable{
  const NewsEvent();

  @override
  List<Object> get props => [];
}
class Fetch extends NewsEvent {
  final String type;

  Fetch({this.type});
   @override
  List<Object> get props => [type];

  @override
  String toString() => 'Fetch $type news';
}
