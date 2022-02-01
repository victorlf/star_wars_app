import 'package:dartz/dartz.dart';
import 'package:escribo_star_wars/core/errors/failures.dart';
import 'package:escribo_star_wars/data/datasources/local/local_datasource.dart';
import 'package:escribo_star_wars/data/datasources/remote/remote_datasource.dart';
import 'package:escribo_star_wars/data/models/character_model.dart';
import 'package:escribo_star_wars/data/models/favorite_model.dart';
import 'package:escribo_star_wars/data/models/movie_model.dart';

class LocalRepository {
  final LocalDatasource datasource;

  LocalRepository(this.datasource);

  Future<Either<Failure, int>> save(FavoriteModel favorite) async {
    try {
      final result = await datasource.save(favorite);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, List<FavoriteModel>>> findAll() async {
    try {
      final result = await datasource.findAll();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, int>> remove(FavoriteModel favorite) async {
    try {
      final result = await datasource.remove(favorite);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
