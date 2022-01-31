import 'package:dartz/dartz.dart';
import 'package:escribo_star_wars/core/errors/failures.dart';
import 'package:escribo_star_wars/data/datasources/remote_datasource.dart';
import 'package:escribo_star_wars/data/models/character_model.dart';
import 'package:escribo_star_wars/data/models/movie_model.dart';

class RemoteRepository {
  final RemoteDatasource datasource;

  RemoteRepository(this.datasource);

  Future<Either<Failure, List<MovieModel>>> getAllMovies() async {
    try {
      final result = await datasource.getAllMovies();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, List<CharacterModel>>> getAllCharacters() async {
    try {
      final result = await datasource.getAllCharacters();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
