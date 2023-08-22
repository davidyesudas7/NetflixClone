// To parse this JSON data, do
//
//     final downloadDataModel = downloadDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:nextflix_clone/domain/downloads_domain/download_poster_entity.dart';

DownloadDataModel downloadDataModelFromJson(String str) =>
    DownloadDataModel.fromJson(json.decode(str));

String downloadDataModelToJson(DownloadDataModel data) =>
    json.encode(data.toJson());

class DownloadDataModel {
  List<Result> results;

  DownloadDataModel({
    required this.results,
  });

  factory DownloadDataModel.fromJson(Map<String, dynamic> json) =>
      DownloadDataModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result extends DownloadPosterEntity with EquatableMixin {
  final String posterPath;
  final int id;
  final String title;

  Result({
    required this.posterPath,
    required this.id,
    required this.title,
  }) : super(posterpath: posterPath, maintitle: title, posterid: id);

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        posterPath: json["poster_path"],
        id: json["id"],
        title: json["title"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "poster_path": posterPath,
        "id": id,
        "title": title,
      };
}
