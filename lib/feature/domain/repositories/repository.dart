import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/feature/domain/entities/registation_response_entity.dart';

abstract class Repository {
  Future<Either<Failure, RegistrationResponseEntity>> registration(
      {String name,
      String emiRatedSid,
      String passPortNumber,
      String mobileNumber,
      String emailId,
      int dateOfBirth,
      int languageId,
      int mobileApplicationId,
      int mobileOsType});
}
