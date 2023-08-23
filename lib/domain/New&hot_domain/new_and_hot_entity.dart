import 'package:equatable/equatable.dart';

class NewAndHotEntity extends Equatable {
  final String backdropPath;
  final int id;
  final String originalTitle;
  final String overview;
  final DateTime releaseDate;

  const NewAndHotEntity({
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
  });

  @override
  List<Object?> get props =>
      [backdropPath, id, originalTitle, overview, releaseDate];
}
