import 'package:equatable/equatable.dart';

class DownloadPosterEntity extends Equatable {
  final String posterpath;
  final String maintitle;
  final int posterid;

  const DownloadPosterEntity(
      {required this.maintitle,
      required this.posterid,
      required this.posterpath});

  @override
  List<Object?> get props => [
        posterpath,
      ];
}
