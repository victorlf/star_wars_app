import 'dart:convert';

import 'package:equatable/equatable.dart';

class FavoriteModel extends Equatable {
  final int id;
  final String name;
  final String url;
  final String type;

  FavoriteModel({
    required this.id,
    required this.name,
    required this.url,
    required this.type,
  });

  @override
  List<Object?> get props => [name, url, type];

  Map<String, dynamic> toMap() {
    return {
      //'id': id,
      'name': name,
      'url': url,
      'type': type,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      url: map['url'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromJson(String source) =>
      FavoriteModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FavoriteModel(id: $id, name: $name, url: $url, type: $type)';
  }
}
