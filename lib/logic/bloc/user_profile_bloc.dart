import 'package:dapper_user/data/providers/create_user_profile_provider.dart';
import 'package:dapper_user/data/repos/create_user_profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_profile_event.dart';
import 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final CreateUserProfileProvider userProfileProvider;

  UserProfileBloc({required this.userProfileProvider})
      : super(UserProfileInitial()) {
    on<CreateUserProfileEvent>(_onCreateUserProfile);
  }

  Future<void> _onCreateUserProfile(
      CreateUserProfileEvent event, Emitter<UserProfileState> emit) async {
    emit(UserProfileLoading());

    try {
      final profile = await userProfileProvider.createUserProfile(
        event.fullname,
        event.shopname,
        event.mobile,
        event.pincode,
        event.place,
        event.district,
        event.city,
      );

      emit(UserProfileSuccess(profile));
    } catch (error) {
      emit(UserProfileFailure(error.toString()));
    }
  }
}
