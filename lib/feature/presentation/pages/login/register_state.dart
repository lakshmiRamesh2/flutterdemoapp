part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class LoginInitial extends RegisterState {

}

class LoadingState extends RegisterState {}

class ErrorState extends RegisterState {
  final String message;

  ErrorState({this.message});

  @override
  List<Object> get props => [message];
}

class LoadedState extends RegisterState {
  final RegistrationResponseEntity userInformation;

  LoadedState({this.userInformation});
}
