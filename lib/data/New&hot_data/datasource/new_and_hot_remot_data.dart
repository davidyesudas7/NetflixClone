import 'package:flutter/material.dart';
import 'package:nextflix_clone/core/exceptions.dart';
import 'package:nextflix_clone/data/New&hot_data/new_and_hot_model.dart';
import 'package:http/http.dart' as http;
import 'package:nextflix_clone/data/urls_apikey.dart';

abstract class NewAndHotRemoteDataSource {
  Future<NewAndHotModel> getnewmoviedata();
  Future<NewAndHotModel> getnewtvdata();
}

class NewAndHotRemoteDataSourceImpl implements NewAndHotRemoteDataSource {
  final http.Client client;

  NewAndHotRemoteDataSourceImpl({required this.client});
  @override
  Future<NewAndHotModel> getnewmoviedata() async {
    final response = await client.get(Uri.parse(newmovieurl));
    debugPrint(response.body);
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final newhotmodel = newAndHotModelFromJson(response.body);
      return newhotmodel;
    }
  }

  @override
  Future<NewAndHotModel> getnewtvdata() async {
    final response = await client.get(Uri.parse(newtvurl));
    debugPrint(response.body);
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final newhotmodel = newAndHotModelFromJson(response.body);
      return newhotmodel;
    }
  }
}
