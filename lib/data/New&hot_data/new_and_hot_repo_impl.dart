import 'package:dartz/dartz.dart';
import 'package:nextflix_clone/core/exceptions.dart';
import 'package:nextflix_clone/data/New&hot_data/datasource/new_and_hot_remot_data.dart';
import 'package:nextflix_clone/domain/New&hot_domain/new_and_hot_entity.dart';
import 'package:nextflix_clone/domain/New&hot_domain/new_and_hot_repo.dart';
import 'package:nextflix_clone/domain/failures.dart';

class NewAndHotRepoImpl implements NewAndHotRepo {
  final NewAndHotRemoteDataSource newAndHotRemoteDataSource;

  NewAndHotRepoImpl({required this.newAndHotRemoteDataSource});

  @override
  Future<Either<Failure, List<NewAndHotEntity>>> getTvposterdata() async {
    try {
      final newTvdata = await newAndHotRemoteDataSource.getnewtvdata();
      final newTvlist = newTvdata.results;
      return right(newTvlist);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralaFailure());
    }
  }

  @override
  Future<Either<Failure, List<NewAndHotEntity>>> getmovieposterdata() async {
    try {
      final newmoviedata = await newAndHotRemoteDataSource.getnewmoviedata();
      final newmovielist = newmoviedata.results;
      return right(newmovielist);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralaFailure());
    }
  }
}
