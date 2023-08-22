import 'package:dartz/dartz.dart';
import 'package:nextflix_clone/domain/downloads_domain/download_poster_entity.dart';
import 'package:nextflix_clone/domain/failures.dart';

abstract class DownloadPosterRepo {
  Future<Either<Failure, List<DownloadPosterEntity>>> getposterdata();
}
