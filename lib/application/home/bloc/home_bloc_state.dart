part of 'home_bloc_bloc.dart';

sealed class HomeBlocState extends Equatable {
  const HomeBlocState();

  @override
  List<Object> get props => [];
}

final class HomeBlocInitial extends HomeBlocState {}

final class HomeBlocloadingState extends HomeBlocState {}

final class HomeBlocPosterlistState extends HomeBlocState {
  final List<HomePagePosterEntity> posterlist;

  const HomeBlocPosterlistState({required this.posterlist});
  @override
  List<Object> get props => [posterlist];
}

final class HomeBlocErrorState extends HomeBlocState {
  final String message;

  const HomeBlocErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
