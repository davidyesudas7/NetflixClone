part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class Searchloading extends SearchState {}

final class SearchInitializedState extends SearchState {
  final List<DownloadPosterEntity?> initialdata;

  const SearchInitializedState({required this.initialdata});

  @override
  List<Object> get props => [initialdata];
}

final class SearchError extends SearchState {
  final String message;

  const SearchError({required this.message});
  @override
  List<Object> get props => [message];
}

final class OnSearchloaded extends SearchState {
  final List<OnSearchEntity> onserachdata;

  const OnSearchloaded({required this.onserachdata});
  @override
  List<Object> get props => [onserachdata];
}
