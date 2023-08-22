import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nextflix_clone/core/exceptions.dart';
import 'package:nextflix_clone/data/search/onsearch_model.dart';
import 'package:nextflix_clone/data/urls_apikey.dart';

abstract class SearchRemoteDataSource {
  Future<OnSearchModel> searchremotedata(String querry);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final http.Client client;

  SearchRemoteDataSourceImpl({required this.client});

  @override
  Future<OnSearchModel> searchremotedata(String querry) async {
    final respone = await client.get(Uri.parse('$onsearchurl&query=$querry'));
    debugPrint(respone.body);
    if (respone.statusCode != 200) {
      throw ServerException();
    } else {
      final onSearchdata = onSearchFromJson(respone.body);
      debugPrint(respone.statusCode.toString());
      return onSearchdata;
    }
  }
}
