import 'package:nextflix_clone/data/api_key.dart';

const String baseurl = 'https://api.themoviedb.org/3';

const String downloadposterurl = '$baseurl/trending/all/day?$apikey';

const String onsearchurl = '$baseurl/search/movie?$apikey';

const String newmovieurl = '$baseurl/discover/movie?$apikey';

const String newtvurl = '$baseurl/discover/tv?$apikey';
