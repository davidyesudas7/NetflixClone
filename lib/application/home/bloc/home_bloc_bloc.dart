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
      final List<HomePagePosterEntity> trendinglist = [];
      final List<HomePagePosterEntity> tvlist = [];
      final List<HomePagePosterEntity> movielist = [];
      final List<HomePagePosterEntity> popularlist = [];
      final newtvlist = await homePagePosterUsecase.getTrendingposter();
      newtvlist.fold(
          (failure) => emit(HomeBlocErrorState(message: _mapfailure(failure))),
          (trending) {
        trendinglist.clear();
        trendinglist.add(trending);
      });

      final newmovielist = await homePagePosterUsecase.getTvposter();
      newmovielist.fold(
          (failure) => emit(HomeBlocErrorState(message: _mapfailure(failure))),
          (tv) {
        tvlist.clear();
        tvlist.add(tv);
      });

      final failureorposterEntity =
          await homePagePosterUsecase.getMovieposter();

      failureorposterEntity.fold(
          (failure) => emit(HomeBlocErrorState(message: _mapfailure(failure))),
          (movie) {
        movielist.clear();
        movielist.add(movie);
      });

      final faillureorhomeEntity =
          await homePagePosterUsecase.getPopuarposter();

      faillureorhomeEntity.fold(
          (failure) => emit(HomeBlocErrorState(message: _mapfailure(failure))),
          (popular) {
        popularlist.clear();
        popularlist.add(popular);
        emit(HomeBlocPosterlistState(
            trendinglist: trendinglist,
            tvlist: tvlist,
            movielist: movielist,
            popularlist: popularlist));
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
