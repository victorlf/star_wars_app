import 'dart:convert';

import 'package:equatable/equatable.dart';

class CharacterModel extends Equatable {
  final String birthYear;
  final String eyeColor;
  final List<String> films;
  final String gender;
  final String hairColor;
  final String height;
  final String homeWorld;
  final String mass;
  final String name;
  final String skinColor;
  final String created;
  final String edited;
  final List<String> species;
  final List<String> starships;
  final String url;
  final List<String> vehicles;

  CharacterModel({
    required this.birthYear,
    required this.eyeColor,
    required this.films,
    required this.gender,
    required this.hairColor,
    required this.height,
    required this.homeWorld,
    required this.mass,
    required this.name,
    required this.skinColor,
    required this.created,
    required this.edited,
    required this.species,
    required this.starships,
    required this.url,
    required this.vehicles,
  });

  Map<String, dynamic> toMap() {
    return {
      'birth_year': birthYear,
      'eye_color': eyeColor,
      'films': films,
      'gender': gender,
      'hair_color': hairColor,
      'height': height,
      'homeWorld': homeWorld,
      'mass': mass,
      'name': name,
      'skin_color': skinColor,
      'created': created,
      'edited': edited,
      'species': species,
      'starships': starships,
      'url': url,
      'vehicles': vehicles,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      birthYear: map['birth_year'] ?? '',
      eyeColor: map['eye_color'] ?? '',
      films: List<String>.from(map['films']),
      gender: map['gender'] ?? '',
      hairColor: map['hair_color'] ?? '',
      height: map['height'] ?? '',
      homeWorld: map['homeWorld'] ?? '',
      mass: map['mass'] ?? '',
      name: map['name'] ?? '',
      skinColor: map['skin_color'] ?? '',
      created: map['created'] ?? '',
      edited: map['edited'] ?? '',
      species: List<String>.from(map['species']),
      starships: List<String>.from(map['starships']),
      url: map['url'] ?? '',
      vehicles: List<String>.from(map['vehicles']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        birthYear,
        eyeColor,
        films,
        gender,
        hairColor,
        height,
        homeWorld,
        mass,
        name,
        skinColor,
        created,
        edited,
        species,
        starships,
        url,
        vehicles,
      ];
}
