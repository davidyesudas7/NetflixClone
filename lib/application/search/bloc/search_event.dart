part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchInitializedEvent extends SearchEvent {}

class OnSearchingEvent extends SearchEvent {
  final String searchvalue;

  const OnSearchingEvent({required this.searchvalue});

  @override
  List<Object> get props => [searchvalue];
}
