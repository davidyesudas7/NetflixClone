import 'package:dartz/dartz.dart';

import 'package:nextflix_clone/domain/failures.dart';
import 'package:nextflix_clone/domain/home_domain/home_page_entity.dart';
import 'package:nextflix_clone/domain/home_domain/home_page_repo.dart';

class HomePagePosterUsecase {
  final HomePagePosterRepo homePagePosterRepo;

  HomePagePosterUsecase({required this.homePagePosterRepo});

  Future<Either<Failure, HomePagePosterEntity>> getTrendingposter() async {
    final posterpathlist = await homePagePosterRepo.getTrendingposterdata();
    return posterpathlist;
  }

  Future<Either<Failure, HomePagePosterEntity>> getTvposter() async {
    final posterpathlist = await homePagePosterRepo.getTvposterdata();

    return posterpathlist;
  }

  Future<Either<Failure, HomePagePosterEntity>> getMovieposter() async {
    final posterpathlist = await homePagePosterRepo.getMovieposterdata();

    return posterpathlist;
  }

  Future<Either<Failure, HomePagePosterEntity>> getPopuarposter() async {
    final posterpathlist = await homePagePosterRepo.getPopularposterdata();

    return posterpathlist;
  }
}
