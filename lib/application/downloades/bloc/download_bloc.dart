import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix_clone/domain/downloads_domain/download_poster_entity.dart';

import 'package:nextflix_clone/domain/downloads_domain/download_poster_usecase.dart';
import 'package:nextflix_clone/domain/failures.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final DownloadPosterUsecase posterUsecase;
  DownloadBloc({required this.posterUsecase}) : super(DownloadInitial()) {
    on<DownloadeposterPathEvent>((event, emit) async {
      emit(DownloadLoadinng());
      final failureorposterEntity = await posterUsecase.getdownloadposter();

      failureorposterEntity.fold(
        (failure) =>
            emit(DownloadeError(message: _maperrormessagestofailure(failure))),
        (posters) => emit(
          DownloadLoaded(posterpath: posters),
        ),
      );
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
