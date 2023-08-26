// To parse this JSON data, do
//
//     final newAndHotMo = newAndHotModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:nextflix_clone/domain/New&hot_domain/new_and_hot_entity.dart';

NewAndHotModel newAndHotModelFromJson(String str) =>
    NewAndHotModel.fromJson(json.decode(str));

String newAndHotModelToJson(NewAndHotModel data) => json.encode(data.toJson());

class NewAndHotModel {
  final List<Result> results;

  NewAndHotModel({
    required this.results,
  });

  factory NewAndHotModel.fromJson(Map<String, dynamic> json) => NewAndHotModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result extends NewAndHotEntity with EquatableMixin {
  final String backdropPath;
  final int id;
  final String originalName;
  final String originalTitle;
  final String overview;
  final DateTime releaseDate;

  Result({
    required this.backdropPath,
    required this.id,
    required this.originalName,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
  }) : super(
            backdropPath: backdropPath,
            id: id,
            originalName: originalName,
            originalTitle: originalTitle,
            overview: overview,
            releaseDate: releaseDate);

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"] ?? '',
        id: json["id"] ?? '',
        originalName: json["original_name"] ?? '',
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? '',
        releaseDate: DateTime.parse(json["release_date"] ?? '0000-00-00'),
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_name": originalName,
        "original_title": originalTitle,
        "overview": overview,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
      };
}
