part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoggedInEvent implements AuthEvent {
  final String email;
  final String password;
  final Function(String message) onFail;
  final Function(UserCredential user) thenValue;

  LoggedInEvent({
    required this.email,
    required this.password,
    required this.onFail,
    required this.thenValue,
  });

  @override
  List<Object?> get props => [email, password];

  @override
  bool? get stringify => false;
}

class RegisterEvent implements AuthEvent {
  final String email;
  final String password;
  final Function(String message) onFail;
  final Function(UserCredential user) thenValue;

  RegisterEvent({
    required this.email,
    required this.password,
    required this.onFail,
    required this.thenValue,
  });

  @override
  List<Object?> get props => [email, password];

  @override
  bool? get stringify => throw UnimplementedError();
}

class LoggedOutEvent implements AuthEvent {
  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}
