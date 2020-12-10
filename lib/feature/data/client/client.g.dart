// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://appdev.cerebrum.ae/covidapi/quarantine';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<RegistrationResponseData> registration(
      name,
      emiRatedSid,
      passPortNumber,
      mobileNumber,
      emailId,
      dateOfBirth,
      languageId,
      mobileApplicationId,
      mobileOsType) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(emiRatedSid, 'emiRatedSid');
    ArgumentError.checkNotNull(passPortNumber, 'passPortNumber');
    ArgumentError.checkNotNull(mobileNumber, 'mobileNumber');
    ArgumentError.checkNotNull(emailId, 'emailId');
    ArgumentError.checkNotNull(dateOfBirth, 'dateOfBirth');
    ArgumentError.checkNotNull(languageId, 'languageId');
    ArgumentError.checkNotNull(mobileApplicationId, 'mobileApplicationId');
    ArgumentError.checkNotNull(mobileOsType, 'mobileOsType');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'name': name,
      'emiratesid': emiRatedSid,
      'passportnumber': passPortNumber,
      'mobilenumber': mobileNumber,
      'emailil': emailId,
      'dateofbirth': dateOfBirth,
      'languageid': languageId,
      'mobileapplicationid': mobileApplicationId,
      'mobileostype': mobileOsType
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/register',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RegistrationResponseData.fromJson(_result.data);
    return value;
  }
}
