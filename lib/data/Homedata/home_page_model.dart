// To parse this JSON data, do
//
//     final downloadDataModel = downloadDataModelFromJson(jsonString);

// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:nextflix_clone/domain/home_domain/home_page_entity.dart';

HomePageDataModel homepageDataModelFromJson(String str) =>
    HomePageDataModel.fromJson(json.decode(str));

String homepageDataModelToJson(HomePageDataModel data) =>
    json.encode(data.toJson());

class HomePageDataModel extends HomePagePosterEntity with EquatableMixin {
  @override
  final List<HomeResult> results;

  HomePageDataModel({
    required this.results,
  }) : super(results: results);

  factory HomePageDataModel.fromJson(Map<String, dynamic> json) =>
      HomePageDataModel(
        results: List<HomeResult>.from(
            json["results"].map((x) => HomeResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class HomeResult {
  final String posterPath;
  final int id;
  final String title;

  HomeResult({
    required this.posterPath,
    required this.id,
    required this.title,
  });

  factory HomeResult.fromJson(Map<String, dynamic> json) => HomeResult(
        posterPath: json["poster_path"] ?? '',
        id: json["id"] ?? '',
        title: json["title"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "poster_path": posterPath,
        "id": id,
        "title": title,
      };
}
