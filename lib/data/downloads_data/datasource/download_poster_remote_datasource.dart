import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nextflix_clone/core/exceptions.dart';
import 'package:nextflix_clone/data/downloads_data/model.dart';
import 'package:nextflix_clone/data/urls_apikey.dart';

abstract class DownloadPosterRemoteDatasource {
  Future<DownloadDataModel> getremotedownloadposter();
}

class DownloadPosterRemoteDatasourceImpl
    implements DownloadPosterRemoteDatasource {
  final http.Client client;

  DownloadPosterRemoteDatasourceImpl({required this.client});
  @override
  Future<DownloadDataModel> getremotedownloadposter() async {
    final response = await client.get(Uri.parse(downloadposterurl));
    debugPrint(response.body);

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final downloadDataModel = downloadDataModelFromJson(response.body);

      return downloadDataModel;
    }
  }
}
