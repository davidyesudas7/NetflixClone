import 'package:dartz/dartz.dart';
import 'package:nextflix_clone/domain/failures.dart';
import 'package:nextflix_clone/domain/search/onsearch_entity.dart';

abstract class OnsearchRepo {
  Future<Either<Failure, List<OnSearchEntity>>> searchdata(String querry);
}
