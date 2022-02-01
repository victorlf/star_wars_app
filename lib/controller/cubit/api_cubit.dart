import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:escribo_star_wars/constants/enums.dart';
import 'package:escribo_star_wars/core/errors/failures.dart';
import 'package:escribo_star_wars/data/models/character_model.dart';
import 'package:escribo_star_wars/data/models/favorite_model.dart';
import 'package:escribo_star_wars/data/models/movie_model.dart';
import 'package:escribo_star_wars/data/repositories/local_repository.dart';
import 'package:escribo_star_wars/data/repositories/remote_repository.dart';
import 'package:flutter/material.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  final RemoteRepository removeRepository;
  final LocalRepository localRepository;
  ApiCubit(this.removeRepository, this.localRepository) : super(ApiLoading());

  List<CharacterModel> charactersCountList = [];
  List<String> favoriteNamesList = [];
  var nextPage = 1;
  var isLoagingRestOfCharacters = false;

  void getAllMovies() async {
    fillFavorites();

    emit(ApiLoading());
    final l = await removeRepository.getAllMovies();
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
    fillFavorites();

    if (nextPage < 9) {
      Either<Failure, List<CharacterModel>> l;
      if (charactersCountList.isEmpty) {
        emit(ApiLoading());
        l = await removeRepository.getAllCharacters();
      } else {
        isLoagingRestOfCharacters = true;
        emit(ApiSuccess(
            charactersList: charactersCountList, dataType: DataType.Character));
        nextPage++;
        l = await removeRepository.getAllCharacters(nextPage: nextPage);
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

  void saveFavorite(FavoriteModel favorite, DataType type) async {
    final result = await localRepository.save(favorite);
    result.fold((e) {
      debugPrint(e.toString());
      emit(ApiError());
    }, (_) {
      if (type == DataType.Movie) {
        getAllMovies();
      } else {
        getAllCharacters();
      }
    });
  }

  void findAllFavorites() async {
    emit(ApiLoading());
    final result = await localRepository.findAll();
    result.fold((e) {
      debugPrint(e.toString());
      emit(ApiError());
      return [];
    }, (success) {
      favoriteNamesList = [];
      success.forEach((element) {
        favoriteNamesList.add(element.name);
      });
      emit(ApiSuccess(favoriteList: success, dataType: DataType.Favorite));
    });
  }

  void fillFavorites() async {
    final result = await localRepository.findAll();
    result.fold((e) {
      debugPrint(e.toString());
      emit(ApiError());
      return [];
    }, (success) {
      favoriteNamesList = [];
      success.forEach((element) {
        favoriteNamesList.add(element.name);
      });
    });
  }

  void removeFavorite(FavoriteModel favorite, DataType type) async {
    final result = await localRepository.remove(favorite);
    result.fold((e) {
      debugPrint(e.toString());
      emit(ApiError());
    }, (_) {
      if (type == DataType.Movie) {
        getAllMovies();
      } else {
        getAllCharacters();
      }
    });
  }
}
