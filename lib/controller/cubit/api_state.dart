part of 'api_cubit.dart';

abstract class ApiState {}

class ApiLoading extends ApiState {}

class ApiSuccess extends ApiState {
  final List<MovieModel>? moviesList;
  final List<CharacterModel>? charactersList;
  final List<FavoriteModel>? favoriteList;
  final DataType dataType;

  ApiSuccess(
      {this.moviesList,
      this.charactersList,
      this.favoriteList,
      required this.dataType});

  List getData() {
    if (dataType == DataType.Movie) {
      return moviesList!;
    } else if (dataType == DataType.Character) {
      return charactersList!;
    } else {
      return favoriteList!;
    }
  }
}

class ApiError extends ApiState {}
