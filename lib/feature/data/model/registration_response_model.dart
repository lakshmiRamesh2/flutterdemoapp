import 'package:json_annotation/json_annotation.dart';

part 'registration_response_model.g.dart';

/// Model class containing registration request data
@JsonSerializable()
class RegistrationResponseModel {
  final RegistrationResponseData request;

  RegistrationResponseModel({this.request});

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationResponseModelToJson(this);
}

@JsonSerializable()
class RegistrationResponseData {
  final String active;
  final String assetgeofenceradius;
  final String assetid;
  final List healthsymptom;
  final String mobilenumber;
  final int dateofbirth;
  final String useruid;
  final int communicationlanguageid;
  final int mobileostype;

  RegistrationResponseData(
      {this.mobileostype,
      this.mobilenumber,
      this.dateofbirth,
      this.active,
      this.assetgeofenceradius,
      this.assetid,
      this.communicationlanguageid,
      this.healthsymptom,
      this.useruid});

  factory RegistrationResponseData.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationResponseDataToJson(this);
}
