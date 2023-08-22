import 'package:get_it/get_it.dart';
import 'package:nextflix_clone/application/downloades/bloc/download_bloc.dart';
import 'package:nextflix_clone/application/search/bloc/search_bloc.dart';
import 'package:nextflix_clone/data/downloads_data/datasource/download_poster_remote_datasource.dart';
import 'package:nextflix_clone/data/downloads_data/download_poster_repo_impl.dart';
import 'package:nextflix_clone/data/search/datasource.dart/onseach_remot_data.dart';
import 'package:nextflix_clone/data/search/onsearch_repo_impl.dart';

import 'package:nextflix_clone/domain/downloads_domain/download_poster_repo.dart';
import 'package:nextflix_clone/domain/downloads_domain/download_poster_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:nextflix_clone/domain/search/onsearch_repo.dart';
import 'package:nextflix_clone/domain/search/onsearch_uscase.dart';

final sl = GetIt.I; // sl = service locator

Future<void> init() async {
  sl.registerFactory(() => DownloadBloc(posterUsecase: sl()));
  sl.registerFactory(() => DownloadPosterUsecase(downloadPosterRepo: sl()));
  sl.registerFactory<DownloadPosterRepo>(
      () => DownloadPosterRepoImpl(datasource: sl()));
  sl.registerFactory<DownloadPosterRemoteDatasource>(
      () => DownloadPosterRemoteDatasourceImpl(client: sl()));

  sl.registerFactory(() => http.Client());
  sl.registerFactory(
      () => SearchBloc(posterUsecase: sl(), onSearchUscase: sl()));

  sl.registerFactory(() => OnSearchUscase(onsearchRepo: sl()));
  sl.registerFactory<OnsearchRepo>(
      () => OnSearchRepoImpl(searchRemoteDataSource: sl()));
  sl.registerFactory<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(client: sl()));
}
