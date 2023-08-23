part of 'new_and_hot_bloc.dart';

sealed class NewAndHotEvent extends Equatable {
  const NewAndHotEvent();

  @override
  List<Object> get props => [];
}

class NewTvDataEvent extends NewAndHotEvent {}

class NewMovieDataEvent extends NewAndHotEvent {}
