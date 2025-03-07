import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dapper_user/data/repos/authRepos.dart';
import 'package:dapper_user/logic/auth/auth/user_auth_event.dart';
import 'package:dapper_user/logic/auth/auth/user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  final Authrepos _authrepos;

  UserAuthBloc(this._authrepos) : super(UserAuthInitial()) {
    log("UserAuthBloc initialized");
    // Registering event handlers
    on<SignUpRequested>(_onSignUpRequested);
    on<SignInRequested>(_onSignInRequested);
    on<OtpVerificationRequested>(_onOtpVerificationRequested);
  }

  // Handling Sign-Up Requests
  Future<void> _onSignUpRequested(
      SignUpRequested event, Emitter<UserAuthState> emit) async {
    emit(UserAuthLoading());

    try {
      final authResponse = await _authrepos
          .userSignUp(event.username, event.password, event.email)
          .timeout(const Duration(seconds: 10));

      if (authResponse.message == "User created successfully.") {
        emit(UserAuthenticated("User Signed Up"));
      } else {
        emit(UserUnAuthenticated(error: 'Invalid signup credentials'));
      }
    } catch (e, s) {
      log('Sign up failed with error: $e', stackTrace: s);
      emit(UserUnAuthenticated(error: 'An unexpected error occurred.'));
    }
  }

  // Handling Sign-In Requests
  Future<void> _onSignInRequested(
      SignInRequested event, Emitter<UserAuthState> emit) async {
    emit(UserAuthLoading());

    try {
      final authResponse = await _authrepos
          .userSignIn(event.username, event.password)
          .timeout(const Duration(seconds: 10));

      if (authResponse.message == "User signed in successfully.") {
        if (authResponse.access != null) {
          emit(UserAuthenticated("User Signed In", token: authResponse.access));
        } else {
          log("no tokens");
          emit(UserUnAuthenticated());
        }
      } else {
        emit(UserUnAuthenticated(error: 'Invalid login credentials'));
      }
    } catch (e, s) {
      log('Sign in failed with error: $e', stackTrace: s);
      emit(UserUnAuthenticated(error: 'An unexpected error occurred.'));
    }
  }

  // OTP Verification handler
  Future<void> _onOtpVerificationRequested(
      OtpVerificationRequested event, Emitter<UserAuthState> emit) async {
    emit(UserAuthLoading());

    try {
      final authResponse = await _authrepos
          .verifyOtp(event.email, event.otp, event.username, event.password)
          .timeout(const Duration(seconds: 10));

      if (authResponse.message == "OTP verified successfully.") {
        emit(UserAuthenticated("OTP Verified"));
      } else {
        emit(UserUnAuthenticated(error: 'Invalid OTP or email.'));
      }
    } catch (e, s) {
      log('OTP verification failed with error: $e', stackTrace: s);
      emit(UserUnAuthenticated(error: 'An unexpected error'));
    }
  }
}
