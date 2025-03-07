import 'package:equatable/equatable.dart';

abstract class UserAuthState extends Equatable {
  const UserAuthState();
  List<Object?> get props => [];
}

class UserAuthInitial extends UserAuthState {}

class UserAuthLoading extends UserAuthState {}

class UserAuthenticated extends UserAuthState {
  final String? token;
  final String authenticated;
  final String? userId;

  const UserAuthenticated(this.authenticated, {this.token, this.userId});
  @override
  List<Object?> get props => [authenticated, token];
}

class UserUnAuthenticated extends UserAuthState {
  final String? error;

  const UserUnAuthenticated({this.error});
  @override
  List<Object?> get props => [error];
}

class UserAuthenticationFailed extends UserAuthState {
  final String? error;

  const UserAuthenticationFailed({required this.error});
  @override
  List<Object?> get props => [error];
}

class OtpVerificationSuccess extends UserAuthState {}

class OtpVerificationFailure extends UserAuthState {}
