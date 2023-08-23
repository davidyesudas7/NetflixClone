// To parse this JSON data, do
//
//     final newAndHotMo = newAndHotMoFromJson(jsonString);

// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:nextflix_clone/domain/New&hot_domain/new_and_hot_entity.dart';

NewAndHotModel newAndHotModelFromJson(String str) =>
    NewAndHotModel.fromJson(json.decode(str));

String newAndHotModelToJson(NewAndHotModel data) => json.encode(data.toJson());

class NewAndHotModel {
  final List<NewHotData> results;

  NewAndHotModel({
    required this.results,
  });

  factory NewAndHotModel.fromJson(Map<String, dynamic> json) => NewAndHotModel(
        results: List<NewHotData>.from(
            json["results"].map((x) => NewHotData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class NewHotData extends NewAndHotEntity with EquatableMixin {
  @override
  final String backdropPath;
  @override
  final int id;
  @override
  final String originalTitle;
  @override
  final String overview;
  @override
  final DateTime releaseDate;

  NewHotData({
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
  }) : super(
            backdropPath: backdropPath,
            id: id,
            originalTitle: originalTitle,
            overview: overview,
            releaseDate: releaseDate);

  factory NewHotData.fromJson(Map<String, dynamic> json) => NewHotData(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
      };
}
