import 'package:dartz/dartz.dart';

import 'package:nextflix_clone/domain/downloads_domain/download_poster_entity.dart';
import 'package:nextflix_clone/domain/downloads_domain/download_poster_repo.dart';
import 'package:nextflix_clone/domain/failures.dart';

class DownloadPosterUsecase {
  final DownloadPosterRepo downloadPosterRepo;

  DownloadPosterUsecase({required this.downloadPosterRepo});
  Future<Either<Failure, List<DownloadPosterEntity>>>
      getdownloadposter() async {
    final posterpathlist = await downloadPosterRepo.getposterdata();

    return posterpathlist;
  }
}
