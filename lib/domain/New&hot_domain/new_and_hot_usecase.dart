import 'package:dartz/dartz.dart';
import 'package:nextflix_clone/domain/New&hot_domain/new_and_hot_entity.dart';
import 'package:nextflix_clone/domain/New&hot_domain/new_and_hot_repo.dart';
import 'package:nextflix_clone/domain/failures.dart';

class NewAndHotUscase {
  final NewAndHotRepo newAndHotRepo;

  NewAndHotUscase({required this.newAndHotRepo});

  Future<Either<Failure, List<NewAndHotEntity>>> getTvrepodata() async {
    final tvrepodata = await newAndHotRepo.getTvposterdata();
    return tvrepodata;
  }

  Future<Either<Failure, List<NewAndHotEntity>>> getmovierepodata() async {
    final movierepodata = await newAndHotRepo.getmovieposterdata();
    return movierepodata;
  }
}
