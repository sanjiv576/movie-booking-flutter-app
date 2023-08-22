import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String? id;
  final String title;
  final String description;
  final String? picture;
  final int? seats;

  const MovieEntity({
    this.id,
    required this.title,
    required this.description,
    this.picture,
    this.seats,
  });

  @override
  List<Object?> get props => [id, title, description, picture, seats];

  @override
  String toString() {
    return 'Movie title : $title, description : $description, picture : $picture, seats : $seats';
  }

  // convert from JSON to object
  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      // picture: json['picture'] as String ?? 'NA',
      seats: json['seats'] as int,
    );
  }

  // convert object to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'picture': picture,
        'seats': seats,
      };

  // convert to entity
  // MovieEntity toEntity() {
  //   return MovieEntity(
  //     title: title,
  //     description: description,
  //     picture: picture,
  //     seats: seats,
  //   );
  // }
}
