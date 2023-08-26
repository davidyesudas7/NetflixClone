import 'package:equatable/equatable.dart';

class NewAndHotEntity extends Equatable {
  final String backdropPath;
  final int id;
  final String originalTitle;
  final String overview;
  final DateTime releaseDate;
  final String originalName;

  const NewAndHotEntity(
      {required this.backdropPath,
      required this.id,
      required this.originalTitle,
      required this.overview,
      required this.releaseDate,
      required this.originalName});

  @override
  List<Object?> get props =>
      [backdropPath, id, originalTitle, overview, releaseDate, originalName];
}
