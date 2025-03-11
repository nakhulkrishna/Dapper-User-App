// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileModel {
  final String fullname;
  final String shopname;
  final String mobile;
  final int pincode;
  final String city;
  final String district;
  final String place;

  ProfileModel({
    required this.shopname,
    required this.fullname,
    required this.mobile,
    required this.pincode,
    required this.city,
    required this.district,
    required this.place,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'shopname': shopname,
      'mobile': mobile,
      'pincode': pincode,
      'city': city,
      'district': district,
      'place': place,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      fullname: map['fullname'] as String,
      shopname: map['shopname'] as String,
      mobile: map['mobile'] as String,
      pincode: map['pincode'] as int,
      city: map['city'] as String,
      district: map['district'] as String,
      place: map['place'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
