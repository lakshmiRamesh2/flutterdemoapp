import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/utils/utils.dart';
import 'package:flutter_app/feature/domain/entities/registation_response_entity.dart';
import 'package:flutter_app/feature/domain/usecase/registration_response_usecase.dart';
import 'package:flutter_app/feature/presentation/bloc/authentication/authentication_bloc.dart';

import 'package:meta/meta.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationBloc authenticationBloc;
  final RegistrtionResponseUseCase registerUseCase;

  RegisterBloc({
    @required AuthenticationBloc authenticationBloc,
    @required RegistrtionResponseUseCase registerUseCase,
  })  : assert(authenticationBloc != null),
        assert(registerUseCase != null),
        registerUseCase = registerUseCase,
        authenticationBloc = authenticationBloc,
        super(LoginInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,

  ) async* {
    RegisterUserEvent eventt;
    if (event is RegisterEvent) {
      yield LoadingState();
      final useCase = await registerUseCase.call(RegistationResponseParams(
          dateOfBirth: 158677847000,
          name: (eventt.name.isEmpty)?"name":eventt.name,
          emailId: "demo@aa.ae",
          emiRatedSid: "784-1986-36240477",
          languageId: 1033,
          mobileApplicationId: 69,
          mobileNumber: (eventt.phonenumber.isEmpty)?"name":eventt.phonenumber,
          mobileOsType: 1,
          passPortNumber: "k907162"));

      yield* useCase.fold((failure) async* {
        if (failure is NetworkFailure) {
          yield ErrorState(message: Utils.ERROR_NO_INTERNET);
        } else if (failure is ServerFailure) {
          yield ErrorState(message: failure.message);
        } else {
          yield ErrorState(message: "Error occurred");
        }
      }, (loadedDataEntity) async* {
        yield LoadedState(userInformation: loadedDataEntity);
      });
    }
  }
}
