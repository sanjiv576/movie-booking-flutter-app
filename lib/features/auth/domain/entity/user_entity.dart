import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String contact;
  final String role;
  final String username;
  final String? password;

  const UserEntity({
    this.id,
    required this.fullName,
    required this.email,
    required this.contact,
    required this.role,
    required this.username,
    this.password,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      contact: json['contact'],
      role: json['role'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? 'NA',
      'fullName': fullName,
      'email': email,
      'contact': contact,
      'role': role,
      'username': username,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'User Full name : $fullName, contact : $contact, email : $email, role : $role, username : $username, password : $password}';
  }

  @override
  List<Object?> get props =>
      [id, fullName, email, contact, role, username, password];
}
