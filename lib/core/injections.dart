import 'package:get_it/get_it.dart';
import 'package:nextflix_clone/application/downloades/bloc/download_bloc.dart';
import 'package:nextflix_clone/application/home/bloc/home_bloc_bloc.dart';
import 'package:nextflix_clone/application/new&hot/bloc/new_and_hot_bloc.dart';
import 'package:nextflix_clone/application/search/bloc/search_bloc.dart';
import 'package:nextflix_clone/data/Homedata/datasource/homepage_remote_datasource.dart';
import 'package:nextflix_clone/data/Homedata/home_page_repo_impl.dart';
import 'package:nextflix_clone/data/New&hot_data/datasource/new_and_hot_remot_data.dart';
import 'package:nextflix_clone/data/New&hot_data/new_and_hot_repo_impl.dart';
import 'package:nextflix_clone/data/downloads_data/datasource/download_poster_remote_datasource.dart';
import 'package:nextflix_clone/data/downloads_data/download_poster_repo_impl.dart';
import 'package:nextflix_clone/data/search/datasource.dart/onseach_remot_data.dart';
import 'package:nextflix_clone/data/search/onsearch_repo_impl.dart';
import 'package:nextflix_clone/domain/New&hot_domain/new_and_hot_repo.dart';
import 'package:nextflix_clone/domain/New&hot_domain/new_and_hot_usecase.dart';

import 'package:nextflix_clone/domain/downloads_domain/download_poster_repo.dart';
import 'package:nextflix_clone/domain/downloads_domain/download_poster_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:nextflix_clone/domain/home_domain/home_page_repo.dart';
import 'package:nextflix_clone/domain/home_domain/home_page_usecase.dart';
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
  sl.registerFactory(() => NewAndHotBloc(newAndHotUscase: sl()));
  sl.registerFactory(() => NewAndHotUscase(newAndHotRepo: sl()));
  sl.registerFactory<NewAndHotRepo>(
      () => NewAndHotRepoImpl(newAndHotRemoteDataSource: sl()));
  sl.registerFactory<NewAndHotRemoteDataSource>(
      () => NewAndHotRemoteDataSourceImpl(client: sl()));
  sl.registerFactory(() => HomeBlocBloc(homePagePosterUsecase: sl()));
  sl.registerFactory(() => HomePagePosterUsecase(homePagePosterRepo: sl()));
  sl.registerFactory<HomePagePosterRepo>(
      () => HomePagePosterRepoImpl(datasource: sl()));
  sl.registerFactory<HomePageRemoteDatasource>(
      () => HomePageRemoteDatasourceImpl(client: sl()));
}
