import 'dart:convert';

import 'package:equatable/equatable.dart';

class FavoriteModel extends Equatable {
  final String name;
  final String url;
  final String type;

  FavoriteModel({
    required this.name,
    required this.url,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
      'type': type,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromJson(String source) =>
      FavoriteModel.fromMap(json.decode(source));

  @override
  List<Object?> get props => [name, url, type];
}
