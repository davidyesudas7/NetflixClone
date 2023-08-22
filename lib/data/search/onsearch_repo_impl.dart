import 'package:dartz/dartz.dart';
import 'package:nextflix_clone/core/exceptions.dart';
import 'package:nextflix_clone/data/search/datasource.dart/onseach_remot_data.dart';

import 'package:nextflix_clone/domain/failures.dart';
import 'package:nextflix_clone/domain/search/onsearch_entity.dart';
import 'package:nextflix_clone/domain/search/onsearch_repo.dart';

class OnSearchRepoImpl implements OnsearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  OnSearchRepoImpl({required this.searchRemoteDataSource});
  @override
  Future<Either<Failure, List<OnSearchEntity>>> searchdata(
      String querry) async {
    try {
      final onserachdata =
          await searchRemoteDataSource.searchremotedata(querry);
      final searchdata = onserachdata.results;
      return right(searchdata);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralaFailure());
    }
  }
}
