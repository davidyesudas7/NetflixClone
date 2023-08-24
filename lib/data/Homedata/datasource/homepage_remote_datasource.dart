import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nextflix_clone/core/exceptions.dart';
import 'package:nextflix_clone/data/Homedata/home_page_model.dart';
import 'package:nextflix_clone/data/urls_apikey.dart';

abstract class HomePageRemoteDatasource {
  Future<HomePageDataModel> getremoteTrendingposter();
  Future<HomePageDataModel> getremoteTvposter();
  Future<HomePageDataModel> getremoteMovieposter();
  Future<HomePageDataModel> getremotePopularposter();
}

class HomePageRemoteDatasourceImpl implements HomePageRemoteDatasource {
  final http.Client client;

  HomePageRemoteDatasourceImpl({required this.client});

  @override
  Future<HomePageDataModel> getremoteTrendingposter() async {
    final response = await client.get(Uri.parse(downloadposterurl));
    debugPrint(response.body);

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final downloadDataModel = homepageDataModelFromJson(response.body);

      return downloadDataModel;
    }
  }

  @override
  Future<HomePageDataModel> getremoteMovieposter() async {
    final response = await client.get(Uri.parse(newtvurl));
    debugPrint(response.body);

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final downloadDataModel = homepageDataModelFromJson(response.body);

      return downloadDataModel;
    }
  }

  @override
  Future<HomePageDataModel> getremotePopularposter() async {
    final response = await client.get(Uri.parse(newmovieurl));
    debugPrint(response.body);

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final downloadDataModel = homepageDataModelFromJson(response.body);

      return downloadDataModel;
    }
  }

  @override
  Future<HomePageDataModel> getremoteTvposter() async {
    final response = await client.get(Uri.parse(homeurl));
    debugPrint(response.body);

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final downloadDataModel = homepageDataModelFromJson(response.body);

      return downloadDataModel;
    }
  }
}
