import 'package:equatable/equatable.dart';

class OnSearchEntity extends Equatable {
  final int id;
  final String originalTitle;
  final String posterPath;

  const OnSearchEntity(
      {required this.id,
      required this.originalTitle,
      required this.posterPath});

  @override
  List<Object?> get props => [id, originalTitle, posterPath];
}
