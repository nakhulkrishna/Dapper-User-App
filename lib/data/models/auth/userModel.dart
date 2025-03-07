import 'dart:convert';

class AuthResponseModel {
  final String? username;
  final String? email;
  final String? password;
  final String? message;
  final String? refresh;
  final String? access;
  final int? user_id;

  AuthResponseModel({
    this.user_id,
    this.access,
    this.refresh,
    this.message,
    this.username,
    this.email,
    this.password,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
        user_id: json['user_id'],
        access: json['access'] is String
            ? json['access'] as String?
            : jsonEncode(json['access']),
        refresh: json['refresh'] as String?,
        message: json['message'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?);
  }
}
