import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/utils/utils.dart';
import 'package:flutter_app/feature/data/client/client.dart';
import 'package:flutter_app/feature/data/model/registration_response_model.dart';

abstract class RemoteDataSource {
  Future<RegistrationResponseData> registration({
    String name,
    String emiRatedSid,
    String passPortNumber,
    String mobileNumber,
    String emailId,
    int dateOfBirth,
    int languageId,
    int mobileApplicationId,
    int mobileOsType,
  });
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final RestClient client;

  RemoteDataSourceImpl({@required this.client});

  @override
  Future<RegistrationResponseData> registration(
      {String name,
      String emiRatedSid,
      String passPortNumber,
      String mobileNumber,
      String emailId,
      int dateOfBirth,
      int languageId,
      int mobileApplicationId,
      int mobileOsType})  async {
  try {
    final response = await client.registration(
        name,
        emiRatedSid,
        passPortNumber,
        mobileNumber,
        emailId,
        dateOfBirth,
        languageId,
        mobileApplicationId,
        mobileOsType);
    if(response.active!=null){
      return response;
    }
    if (response.active == null) {
      if (response.active == null) {
        throw ValidationException(message: "Sucessful");
      }
      throw ServerException();
    } else if (response.assetid == null)
      return response;
    else
      return response;
  } on Exception {
    throw ServerException(message: Utils.ERROR_NO_RESPONSE);
  }
}
}
