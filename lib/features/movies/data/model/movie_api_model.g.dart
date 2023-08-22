// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieApiModel _$MovieApiModelFromJson(Map<String, dynamic> json) =>
    MovieApiModel(
      id: json['_id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      picture: json['picture'] as String?,
      seats: json['seats'] as int?,
    );

Map<String, dynamic> _$MovieApiModelToJson(MovieApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'picture': instance.picture,
      'seats': instance.seats,
    };
