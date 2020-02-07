import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable{
  const NewsEvent();

  @override
  List<Object> get props => [];
}
class Fetch extends NewsEvent {}
