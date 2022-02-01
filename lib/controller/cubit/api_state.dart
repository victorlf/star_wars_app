part of 'api_cubit.dart';

abstract class ApiState {}

class ApiLoading extends ApiState {}

class ApiSuccess extends ApiState {
  final List<MovieModel>? moviesList;
  final List<CharacterModel>? charactersList;
  final DataType dataType;

  ApiSuccess({this.moviesList, this.charactersList, required this.dataType});

  List getData() {
    if (dataType == DataType.Movie) {
      return moviesList!;
    } else {
      return charactersList!;
    }
  }
}

class ApiError extends ApiState {}
