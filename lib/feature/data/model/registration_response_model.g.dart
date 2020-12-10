// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationResponseModel _$RegistrationResponseModelFromJson(
    Map<String, dynamic> json) {
  return RegistrationResponseModel(
    request: json['request'] == null
        ? null
        : RegistrationResponseData.fromJson(
            json['request'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RegistrationResponseModelToJson(
        RegistrationResponseModel instance) =>
    <String, dynamic>{
      'request': instance.request,
    };

RegistrationResponseData _$RegistrationResponseDataFromJson(
    Map<String, dynamic> json) {
  return RegistrationResponseData(
    mobileostype: json['mobileostype'] as int,
    mobilenumber: json['mobilenumber'] as String,
    dateofbirth: json['dateofbirth'] as int,
    active: json['active'] as String,
    assetgeofenceradius: json['assetgeofenceradius'] as String,
    assetid: json['assetid'] as String,
    communicationlanguageid: json['communicationlanguageid'] as int,
    healthsymptom: json['healthsymptom'] as List,
    useruid: json['useruid'] as String,
  );
}

Map<String, dynamic> _$RegistrationResponseDataToJson(
        RegistrationResponseData instance) =>
    <String, dynamic>{
      'active': instance.active,
      'assetgeofenceradius': instance.assetgeofenceradius,
      'assetid': instance.assetid,
      'healthsymptom': instance.healthsymptom,
      'mobilenumber': instance.mobilenumber,
      'dateofbirth': instance.dateofbirth,
      'useruid': instance.useruid,
      'communicationlanguageid': instance.communicationlanguageid,
      'mobileostype': instance.mobileostype,
    };
