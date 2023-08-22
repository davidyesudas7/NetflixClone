import 'package:dartz/dartz.dart';
import 'package:nextflix_clone/domain/failures.dart';
import 'package:nextflix_clone/domain/search/onsearch_entity.dart';
import 'package:nextflix_clone/domain/search/onsearch_repo.dart';

class OnSearchUscase {
  final OnsearchRepo onsearchRepo;

  OnSearchUscase({required this.onsearchRepo});

  Future<Either<Failure, List<OnSearchEntity>>> onsearch(String querry) async {
    final searchdata = await onsearchRepo.searchdata(querry);

    return searchdata;
  }
}
