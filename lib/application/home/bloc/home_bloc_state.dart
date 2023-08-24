part of 'home_bloc_bloc.dart';

sealed class HomeBlocState extends Equatable {
  const HomeBlocState();

  @override
  List<Object> get props => [];
}

final class HomeBlocInitial extends HomeBlocState {}

final class HomeBlocloadingState extends HomeBlocState {}

final class HomeBlocPosterlistState extends HomeBlocState {
  final List<HomePagePosterEntity> trendinglist;
  final List<HomePagePosterEntity> tvlist;
  final List<HomePagePosterEntity> movielist;
  final List<HomePagePosterEntity> popularlist;

  const HomeBlocPosterlistState({
    required this.trendinglist,
    required this.tvlist,
    required this.movielist,
    required this.popularlist,
  });
  @override
  List<Object> get props => [trendinglist, tvlist, movielist, popularlist];
}

final class HomeBlocErrorState extends HomeBlocState {
  final String message;

  const HomeBlocErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
