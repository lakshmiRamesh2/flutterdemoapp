import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/utils/my_shared_pref.dart';


import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final MySharedPref sharedPref;

  AuthenticationBloc({@required MySharedPref sharedPref})
      : assert(sharedPref != null),
        sharedPref = sharedPref,
        super(Uninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    // app start
    if (event is AppStarted) {
      var token = await _getToken();
      if (token != '') {
        // Storage().token = token;
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    }

    if (event is LoggedIn) {
      // Storage().token = event.token;
      await _saveToken(event.token);
      await _saveUserName(event.userName);
      yield Authenticated();
    }

    if (event is LoggedOut) {
      // Storage().token = '';
      await _deleteToken();
      yield Unauthenticated();
    }
  }

  /// delete from keystore/keychain
  Future<void> _deleteToken() async {
    // await Storage().secureStorage.delete(key: 'access_token');
  }

  /// write to keystore/keychain
  Future<void> _saveToken(String token) async {
    // await Storage().secureStorage.write(key: 'access_token', value: token);
    sharedPref.saveToken(token);
  }

  /// read to keystore/keychain
  Future<String> _getToken() async {
    return sharedPref.getToken();
    // return await Storage().secureStorage.read(key: 'access_token') ?? '';
  }

  /// write to keystore/keychain
  Future<void> _saveUserName(String userName) async {
    // await Storage().secureStorage.write(key: 'access_token', value: token);
    sharedPref.saveUserName(userName);
  }

  /// read to keystore/keychain
  Future<String> getUserName() async {
    return sharedPref.getUserName();
    // return await Storage().secureStorage.read(key: 'access_token') ?? '';
  }
}
