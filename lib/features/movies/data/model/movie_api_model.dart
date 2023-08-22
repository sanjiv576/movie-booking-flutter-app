import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/movie_entity.dart';

part 'movie_api_model.g.dart';

final movieApiModelProvider = Provider((ref) => MovieApiModel.empty());

@JsonSerializable()
class MovieApiModel {
  @JsonKey(name: '_id')
  final String? id;
  final String title;
  final String description;
  final String? picture;
  final int? seats;

  MovieApiModel({
    this.id,
    required this.title,
    required this.description,
    this.picture,
    this.seats,
  });

  MovieApiModel.empty()
      : this(
          id: '',
          title: '',
          description: '',
          picture: '',
          seats: 0,
        );

  // convert json to object
  factory MovieApiModel.fromJson(Map<String, dynamic> json) =>
      _$MovieApiModelFromJson(json);

  // convert object to json
  Map<String, dynamic> toJson() => _$MovieApiModelToJson(this);

  // convert to entity
  MovieEntity toEntity() {
    return MovieEntity(
      title: title,
      description: description,
      picture: picture,
      seats: seats,
    );
  }

  // convert to list of enitities
  List<MovieEntity> toEntityList(List<MovieApiModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
