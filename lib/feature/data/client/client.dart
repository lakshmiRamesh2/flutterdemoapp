import 'package:dio/dio.dart';
import 'package:flutter_app/core/utils/my_shared_pref.dart';
import 'package:flutter_app/core/utils/utils.dart';
import 'package:flutter_app/feature/data/model/registration_response_model.dart';

import 'package:retrofit/http.dart';

part 'client.g.dart';

@RestApi(baseUrl: "http://appdev.cerebrum.ae/covidapi/quarantine")
abstract class RestClient {
  /// flutter pub run build_runner build --delete-conflicting-outputs

  factory RestClient(final Dio dio, final MySharedPref sharedPref) {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions option) {
      /// Additional headers information
      option.headers[Utils.AUTHORIZATION] = Utils.AUTHORIZATION_TOKEN;
      option.headers[Utils.X_MESSAGE_ID] = Utils.X_MESSAGE_ID_TOKEN;
      option.headers[Utils.CONTENT_TYPE] = Utils.CONTENT_APPLICATION_JSON;
      /*if (sharedPref.getAuthToken() != null &&
          sharedPref.getAuthToken().isNotEmpty) {
        option.headers[Constants.AUTHORIZATION] =
        "Bearer " + sharedPref.getAuthToken();

      }
  */
      return option;
    }));
    return _RestClient(dio);
  }




  @POST("/register")
  Future<RegistrationResponseData> registration(
    @Field("name") String name,
    @Field("emiratesid") String emiRatedSid,
      @Field("passportnumber") String passPortNumber,
      @Field("mobilenumber") String mobileNumber,
      @Field("emailil") String emailId,
      @Field("dateofbirth") int dateOfBirth,
      @Field("languageid") int languageId,
      @Field("mobileapplicationid") int mobileApplicationId,
      @Field("mobileostype") int mobileOsType,

  );




}
