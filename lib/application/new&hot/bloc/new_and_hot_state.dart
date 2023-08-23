part of 'new_and_hot_bloc.dart';

sealed class NewAndHotState extends Equatable {
  const NewAndHotState();

  @override
  List<Object> get props => [];
}

final class NewAndHotInitialState extends NewAndHotState {}

final class NewAndHotLoadingState extends NewAndHotState {}

final class NewAndHotTvLoadedState extends NewAndHotState {
  final List<NewAndHotEntity> tvlist;

  const NewAndHotTvLoadedState({required this.tvlist});

  @override
  List<Object> get props => [tvlist];
}

final class NewAndHotMovieLoadedState extends NewAndHotState {
  final List<NewAndHotEntity> movielist;

  const NewAndHotMovieLoadedState({required this.movielist});

  @override
  List<Object> get props => [movielist];
}

final class NewAndHotErrorState extends NewAndHotState {
  final String message;

  const NewAndHotErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
