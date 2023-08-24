import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix_clone/domain/failures.dart';
import 'package:nextflix_clone/domain/home_domain/home_page_entity.dart';
import 'package:nextflix_clone/domain/home_domain/home_page_usecase.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final HomePagePosterUsecase homePagePosterUsecase;
  HomeBlocBloc({required this.homePagePosterUsecase})
      : super(HomeBlocInitial()) {
    on<HomeBlocDataCallinEvent>((event, emit) async {
      emit(HomeBlocloadingState());
      final List<HomePagePosterEntity> posterlist = [];
      final newtvlist = await homePagePosterUsecase.getTrendingposter();
      newtvlist.fold(
          (failure) => emit(HomeBlocErrorState(message: _mapfailure(failure))),
          (trending) {
        posterlist.add(trending);
        HomeBlocPosterlistState(posterlist: posterlist);
      });

      final newmovielist = await homePagePosterUsecase.getTvposter();
      newmovielist.fold(
          (failure) => emit(HomeBlocErrorState(message: _mapfailure(failure))),
          (tv) {
        posterlist.add(tv);
        emit(HomeBlocPosterlistState(posterlist: posterlist));
      });

      final failureorposterEntity =
          await homePagePosterUsecase.getMovieposter();

      failureorposterEntity.fold(
          (failure) => emit(HomeBlocErrorState(message: _mapfailure(failure))),
          (movie) {
        posterlist.add(movie);
        HomeBlocPosterlistState(posterlist: posterlist);
      });

      final faillureorhomeEntity =
          await homePagePosterUsecase.getPopuarposter();

      faillureorhomeEntity.fold(
          (failure) => emit(HomeBlocErrorState(message: _mapfailure(failure))),
          (popular) {
        posterlist.add(popular);
        HomeBlocPosterlistState(posterlist: posterlist);
      });
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
