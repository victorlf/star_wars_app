import 'dart:convert';

import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final List<String> characters;
  final String created;
  final String director;
  final String edited;
  final String episodeId;
  final String openingCrawl;
  final List<String> planets;
  final String producer;
  final String releaseDate;
  final List<String> species;
  final List<String> starships;
  final String title;
  final String url;
  final List<String> vehicles;

  MovieModel({
    required this.characters,
    required this.created,
    required this.director,
    required this.edited,
    required this.episodeId,
    required this.openingCrawl,
    required this.planets,
    required this.producer,
    required this.releaseDate,
    required this.species,
    required this.starships,
    required this.title,
    required this.url,
    required this.vehicles,
  });

  Map<String, dynamic> toMap() {
    return {
      'characters': characters,
      'created': created,
      'director': director,
      'edited': edited,
      'episode_id': episodeId,
      'opening_crawl': openingCrawl,
      'planets': planets,
      'producer': producer,
      'release_date': releaseDate,
      'species': species,
      'starships': starships,
      'title': title,
      'url': url,
      'vehicles': vehicles,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      characters: List<String>.from(map['characters']),
      created: map['created'] ?? '',
      director: map['director'] ?? '',
      edited: map['edited'] ?? '',
      episodeId: map['episode_id'] ?? '',
      openingCrawl: map['opening_crawl'] ?? '',
      planets: List<String>.from(map['planets']),
      producer: map['producer'] ?? '',
      releaseDate: map['release_date'] ?? '',
      species: List<String>.from(map['species']),
      starships: List<String>.from(map['starships']),
      title: map['title'] ?? '',
      url: map['url'] ?? '',
      vehicles: List<String>.from(map['vehicles']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        characters,
        created,
        director,
        edited,
        episodeId,
        openingCrawl,
        planets,
        producer,
        releaseDate,
        species,
        starships,
        title,
        url,
        vehicles,
      ];
}
