import 'package:equatable/equatable.dart';
import 'package:nextflix_clone/data/Homedata/home_page_model.dart';

class HomePagePosterEntity extends Equatable {
  final List<HomeResult> results;

  const HomePagePosterEntity({required this.results});

  @override
  List<Object?> get props => [results];
}
