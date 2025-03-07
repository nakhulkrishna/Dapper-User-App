import 'package:equatable/equatable.dart';

abstract class UserAuthEvent extends Equatable {
  const UserAuthEvent();
  @override
  List<Object> get props => [];
}

class SignUpRequested extends UserAuthEvent {
  final String username;
  final String password;
  final String email;

  const SignUpRequested(this.username, this.password, this.email);
}

class SignInRequested extends UserAuthEvent {
  final String username;
  final String password;

  const SignInRequested(
    this.username,
    this.password,
  );
}

class OtpVerificationRequested extends UserAuthEvent {
  final String email;
  final String otp;
  final String username;
  final String password;

  const OtpVerificationRequested(
      this.email, this.otp, this.username, this.password);

  @override
  List<Object> get props => [email, otp, username, password];
}

class LogoutRequested extends UserAuthEvent {}
