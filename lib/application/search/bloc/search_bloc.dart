import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix_clone/domain/downloads_domain/download_poster_entity.dart';
import 'package:nextflix_clone/domain/downloads_domain/download_poster_usecase.dart';
import 'package:nextflix_clone/domain/failures.dart';
import 'package:nextflix_clone/domain/search/onsearch_entity.dart';
import 'package:nextflix_clone/domain/search/onsearch_uscase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final OnSearchUscase onSearchUscase;
  final DownloadPosterUsecase posterUsecase;
  SearchBloc({required this.posterUsecase, required this.onSearchUscase})
      : super(SearchInitial()) {
    on<SearchInitializedEvent>((event, emit) async {
      emit(Searchloading());
      final failureorinitialsearch = await posterUsecase.getdownloadposter();
      failureorinitialsearch.fold(
          (failure) =>
              emit(SearchError(message: _maperrormessagestofailure(failure))),
          (serachdata) =>
              emit(SearchInitializedState(initialdata: serachdata)));
    });

    on<OnSearchingEvent>((event, emit) async {
      emit(Searchloading());
      final failurorsearchdata =
          await onSearchUscase.onsearch(event.searchvaue);
      failurorsearchdata.fold(
          (failure) =>
              emit(SearchError(message: _maperrormessagestofailure(failure))),
          (onserachdata) => emit(OnSearchloaded(onserachdata: onserachdata)));
    });
  }

  String _maperrormessagestofailure(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return kServerfailure;

      case CacheFailure:
        return kCachefailure;

      default:
        return kGenaralfailure;
    }
  }
}
