import 'package:equatable/equatable.dart';
import 'package:dapper_user/data/models/profile/profile_model.dart';

// Define the states for the Bloc
abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileSuccess extends UserProfileState {
  final ProfileModel profile;

  const UserProfileSuccess(this.profile);

  @override
  List<Object> get props => [profile];
}

class UserProfileFailure extends UserProfileState {
  final String error;

  const UserProfileFailure(this.error);

  @override
  List<Object> get props => [error];
}
