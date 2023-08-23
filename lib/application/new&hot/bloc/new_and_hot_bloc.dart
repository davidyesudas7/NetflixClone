import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix_clone/domain/New&hot_domain/new_and_hot_entity.dart';
import 'package:nextflix_clone/domain/New&hot_domain/new_and_hot_usecase.dart';
import 'package:nextflix_clone/domain/failures.dart';

part 'new_and_hot_event.dart';
part 'new_and_hot_state.dart';

class NewAndHotBloc extends Bloc<NewAndHotEvent, NewAndHotState> {
  final NewAndHotUscase newAndHotUscase;
  NewAndHotBloc({required this.newAndHotUscase})
      : super(NewAndHotInitialState()) {
    on<NewTvDataEvent>((event, emit) async {
      emit(NewAndHotLoadingState());
      final newtvlist = await newAndHotUscase.getTvrepodata();
      newtvlist.fold(
          (failure) => emit(NewAndHotErrorState(message: _mapfailure(failure))),
          (tvlist) => emit(NewAndHotTvLoadedState(tvlist: tvlist)));
    });

    on<NewMovieDataEvent>((event, emit) async {
      emit(NewAndHotLoadingState());
      final newmovielist = await newAndHotUscase.getmovierepodata();
      newmovielist.fold(
          (failure) => emit(NewAndHotErrorState(message: _mapfailure(failure))),
          (movielist) => NewAndHotMovieLoadedState(movielist: movielist));
    });
  }

  String _mapfailure(Failure failure) {
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
