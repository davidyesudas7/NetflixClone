import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:nextflix_clone/core/exceptions.dart';

import 'package:nextflix_clone/data/downloads_data/datasource/download_poster_remote_datasource.dart';
import 'package:nextflix_clone/domain/downloads_domain/download_poster_entity.dart';
import 'package:nextflix_clone/domain/downloads_domain/download_poster_repo.dart';
import 'package:nextflix_clone/domain/failures.dart';

class DownloadPosterRepoImpl implements DownloadPosterRepo {
  final DownloadPosterRemoteDatasource datasource;

  DownloadPosterRepoImpl({required this.datasource});
  @override
  Future<Either<Failure, List<DownloadPosterEntity>>> getposterdata() async {
    try {
      final result = await datasource.getremotedownloadposter();
      List<DownloadPosterEntity> posterlist = [];
      for (var posteresult in result.results) {
        if (posteresult.title.isNotEmpty) {
          posterlist.add(posteresult);
        }
      }

      return right(posterlist);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      debugPrint(e.toString());
      return left(GeneralaFailure());
    }
  }
}
