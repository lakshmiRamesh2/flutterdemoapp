part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable {}

class RegisterUserEvent extends RegisterEvent {
  final String name;
  final String phonenumber;

  RegisterUserEvent({this.name, this.phonenumber});

  @override
  List<Object> get props => [name,phonenumber];
}
