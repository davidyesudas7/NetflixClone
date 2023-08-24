import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:nextflix_clone/core/exceptions.dart';
import 'package:nextflix_clone/data/Homedata/datasource/homepage_remote_datasource.dart';

import 'package:nextflix_clone/domain/failures.dart';
import 'package:nextflix_clone/domain/home_domain/home_page_entity.dart';

import 'package:nextflix_clone/domain/home_domain/home_page_repo.dart';

class HomePagePosterRepoImpl implements HomePagePosterRepo {
  final HomePageRemoteDatasource datasource;

  HomePagePosterRepoImpl({required this.datasource});
  @override
  Future<Either<Failure, HomePagePosterEntity>> getTrendingposterdata() async {
    try {
      final result = await datasource.getremoteTrendingposter();
      final posterlist = result;
      return right(posterlist);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      debugPrint(e.toString());
      return left(GeneralaFailure());
    }
  }

  @override
  Future<Either<Failure, HomePagePosterEntity>> getTvposterdata() async {
    try {
      final result = await datasource.getremoteTvposter();
      final posterlist = result;
      return right(posterlist);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      debugPrint(e.toString());
      return left(GeneralaFailure());
    }
  }

  @override
  Future<Either<Failure, HomePagePosterEntity>> getMovieposterdata() async {
    try {
      final result = await datasource.getremoteMovieposter();
      final posterlist = result;
      return right(posterlist);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      debugPrint(e.toString());
      return left(GeneralaFailure());
    }
  }

  @override
  Future<Either<Failure, HomePagePosterEntity>> getPopularposterdata() async {
    try {
      final result = await datasource.getremotePopularposter();
      final posterlist = result;
      return right(posterlist);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      debugPrint(e.toString());
      return left(GeneralaFailure());
    }
  }
}
