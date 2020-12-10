import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/network/network_info.dart';
import 'package:flutter_app/feature/data/datasource/local_datasource.dart';
import 'package:flutter_app/feature/data/datasource/remote_datasource.dart';
import 'package:flutter_app/feature/domain/entities/registation_response_entity.dart';
import 'package:flutter_app/feature/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl(
      {@required this.networkInfo,
      @required this.localDataSource,
      @required this.remoteDataSource});

  @override
  Future<Either<Failure, RegistrationResponseEntity>> registration(
      {String name,
      String emiRatedSid,
      String passPortNumber,
      String mobileNumber,
      String emailId,
      int dateOfBirth,
      int languageId,
      int mobileApplicationId,
      int mobileOsType}) async {

    try {
      final loadedDataModel = await remoteDataSource.registration(
          passPortNumber: passPortNumber,
          name: name,
          mobileOsType: mobileOsType,
          mobileNumber: mobileNumber,
          mobileApplicationId: mobileApplicationId,
          languageId: languageId,
          emiRatedSid: emiRatedSid,
          emailId: emailId,
          dateOfBirth: dateOfBirth);
      return Right(RegistrationResponseEntity(
        active: loadedDataModel.active,
        assetgeofenceradius: loadedDataModel.assetgeofenceradius,
        assetid: loadedDataModel.assetid,
        communicationlanguageid: loadedDataModel.communicationlanguageid,
        dateofbirth: loadedDataModel.dateofbirth,
        healthsymptom: loadedDataModel.healthsymptom,
        mobilenumber: loadedDataModel.mobilenumber,
        mobileostype: loadedDataModel.mobileostype,
        useruid: loadedDataModel.useruid,
      ));
    } on ValidationException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
    // } else {
    //   return Left(NetworkFailure());
    // }
  }
}
