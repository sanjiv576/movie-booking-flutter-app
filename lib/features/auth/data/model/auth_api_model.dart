import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/user_entity.dart';

part 'auth_api_model.g.dart';

// dart run build_runner build --delete-conflicting-outputs
final authApiModelProvider =
    Provider<AuthApiModel>((ref) => AuthApiModel.empty());

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? id;
  final String fullName;
  final String email;
  final String contact;
  final String role;
  final String username;
  final String? password;

  AuthApiModel(
      {this.id,
      required this.fullName,
      required this.email,
      required this.contact,
      required this.role,
      required this.username,
      this.password});

  AuthApiModel.empty()
      : this(
          id: '',
          fullName: '',
          email: '',
          contact: '',
          role: '',
          username: '',
          password: '',
        );

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  UserEntity toEntity() => UserEntity(
        fullName: fullName,
        email: email,
        contact: contact,
        role: role,
        username: username,
      );
}
