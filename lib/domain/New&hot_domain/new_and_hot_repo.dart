import 'package:dartz/dartz.dart';
import 'package:nextflix_clone/domain/New&hot_domain/new_and_hot_entity.dart';
import 'package:nextflix_clone/domain/failures.dart';

abstract class NewAndHotRepo {
  Future<Either<Failure, List<NewAndHotEntity>>> getmovieposterdata();
  Future<Either<Failure, List<NewAndHotEntity>>> getTvposterdata();
}
