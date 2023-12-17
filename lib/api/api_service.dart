import 'dart:convert';

import 'package:rawflix/models/movie.dart';

import '../config/app_config.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _tendingUrl =
      "${AppConfig.baseUrl}trending/movie/day?language=ru-RU&api_key=${AppConfig.apiKey}";
  static const String _toRateUrl =
      "${AppConfig.baseUrl}movie/top_rated?language=ru-RU&api_key=${AppConfig.apiKey}";
  static const String _upcomingUrl =
      "${AppConfig.baseUrl}movie/upcoming?language=ru-RU&api_key=${AppConfig.apiKey}";

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_tendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<List<Movie>> getToRatedMovies() async {
    final response = await http.get(Uri.parse(_toRateUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }
}
