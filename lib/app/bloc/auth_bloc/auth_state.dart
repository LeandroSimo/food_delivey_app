part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class InitState implements AuthState {}

class LoggedInState implements AuthState {
  final bool isLoading;
  final bool isSuccess;

  LoggedInState({
    required this.isLoading,
    required this.isSuccess,
  });
}

class LoggedOutState implements AuthState {
  final bool isLoading;
  final bool isSuccess;

  LoggedOutState({
    required this.isLoading,
    required this.isSuccess,
  });
}

class IsLoading implements AuthState {
  final bool isLoading;
  IsLoading({
    required this.isLoading,
  });
}
