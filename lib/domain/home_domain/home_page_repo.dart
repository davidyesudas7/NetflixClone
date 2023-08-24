import 'package:dartz/dartz.dart';
import 'package:nextflix_clone/domain/failures.dart';
import 'package:nextflix_clone/domain/home_domain/home_page_entity.dart';

abstract class HomePagePosterRepo {
  Future<Either<Failure, HomePagePosterEntity>> getTrendingposterdata();
  Future<Either<Failure, HomePagePosterEntity>> getTvposterdata();
  Future<Either<Failure, HomePagePosterEntity>> getMovieposterdata();
  Future<Either<Failure, HomePagePosterEntity>> getPopularposterdata();
}
