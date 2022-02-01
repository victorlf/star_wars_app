import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:escribo_star_wars/constants/enums.dart';
import 'package:escribo_star_wars/core/errors/failures.dart';
import 'package:escribo_star_wars/data/models/character_model.dart';
import 'package:escribo_star_wars/data/models/movie_model.dart';
import 'package:escribo_star_wars/data/repositories/remote_repository.dart';
import 'package:flutter/material.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  final RemoteRepository repository;
  ApiCubit(this.repository) : super(ApiLoading());

  List<CharacterModel> charactersCountList = [];
  var nextPage = 1;
  var isLoagingRestOfCharacters = false;

  void getAllMovies() async {
    emit(ApiLoading());
    final l = await repository.getAllMovies();
    l.fold((e) {
      debugPrint(e.toString());
      emit(ApiError());
    }, (success) {
      for (var m in success) {
        debugPrint(m.toString());
      }
      emit(ApiSuccess(moviesList: success, dataType: DataType.Movie));
    });
  }

  void getAllCharacters() async {
    if (nextPage < 9) {
      Either<Failure, List<CharacterModel>> l;
      if (charactersCountList.isEmpty) {
        emit(ApiLoading());
        l = await repository.getAllCharacters();
      } else {
        isLoagingRestOfCharacters = true;
        emit(ApiSuccess(
            charactersList: charactersCountList, dataType: DataType.Character));
        nextPage++;
        l = await repository.getAllCharacters(nextPage: nextPage);
      }
      isLoagingRestOfCharacters = false;
      l.fold((e) {
        debugPrint(e.toString());
        emit(ApiError());
      }, (success) {
        // for (var m in success) {
        //   debugPrint(m.toString());
        // }
        charactersCountList.addAll(success);
        emit(ApiSuccess(
            charactersList: charactersCountList, dataType: DataType.Character));
      });
    } else {
      emit(ApiSuccess(
          charactersList: charactersCountList, dataType: DataType.Character));
    }
  }
}
