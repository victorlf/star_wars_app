import 'dart:convert';

import 'package:escribo_star_wars/core/errors/exception.dart';
import 'package:escribo_star_wars/core/http_client/http_client.dart';
import 'package:escribo_star_wars/data/datasources/endpoints.dart';
import 'package:escribo_star_wars/data/models/character_model.dart';
import 'package:escribo_star_wars/data/models/movie_model.dart';

class RemoteDatasource {
  final IHttpClient client;

  RemoteDatasource(this.client);

  Future<List<MovieModel>> getAllMovies() async {
    final response = await client.get(Endpoints.movies());
    if (response.statusCode == 200) {
      final data = json.decode(response.data);
      return List<MovieModel>.from(
          data['results'].map((x) => MovieModel.fromMap(x)));
    } else {
      return throw ServerException;
    }
  }

  Future<List<CharacterModel>> getAllCharacters({int? nextPage}) async {
    HttpResponse response;
    if (nextPage != null) {
      response = await client.get('${Endpoints.characters()}?page=$nextPage');
    } else {
      response = await client.get(Endpoints.characters());
    }
    if (response.statusCode == 200) {
      final data = json.decode(response.data);
      return List<CharacterModel>.from(
          data['results'].map((x) => CharacterModel.fromMap(x)));
    } else {
      return throw ServerException;
    }
  }
}
