import 'package:equatable/equatable.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class CreateUserProfileEvent extends UserProfileEvent {
  final String fullname;
  final String shopname;
  final int mobile;
  final int pincode;
  final String place;
  final String district;
  final String city;

  const CreateUserProfileEvent({
    required this.fullname,
    required this.shopname,
    required this.mobile,
    required this.pincode,
    required this.place,
    required this.district,
    required this.city,
  });

  @override
  List<Object> get props =>
      [fullname, shopname, mobile, pincode, place, district, city];
}
