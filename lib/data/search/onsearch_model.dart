// To parse this JSON data, do
//
//     final onSearch = onSearchFromJson(jsonString);

// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:nextflix_clone/domain/search/onsearch_entity.dart';

OnSearchModel onSearchFromJson(String str) =>
    OnSearchModel.fromJson(json.decode(str));

String onSearchToJson(OnSearchModel data) => json.encode(data.toJson());

class OnSearchModel {
  List<Result> results;

  OnSearchModel({
    required this.results,
  });

  factory OnSearchModel.fromJson(Map<String, dynamic> json) => OnSearchModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result extends OnSearchEntity with EquatableMixin {
  @override
  final int id;
  @override
  final String originalTitle;
  @override
  final String posterPath;

  Result({
    required this.id,
    required this.originalTitle,
    required this.posterPath,
  }) : super(id: id, originalTitle: originalTitle, posterPath: posterPath);

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        originalTitle: json["original_title"],
        posterPath: json["poster_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "original_title": originalTitle,
        "poster_path": posterPath,
      };
}
