import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/data/service/auth/firebase_autentication.dart';
// import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitState()) {
    on<LoggedInEvent>(_loggedIn);
    on<LoggedOutEvent>(_loggedOut);
    on<RegisterEvent>(_register);
  }

  Future<void> _loggedIn(LoggedInEvent event, Emitter<AuthState> emit) async {
    emit(LoggedOutState(isLoading: true, isSuccess: false));
    emit(IsLoading(isLoading: true));
    try {
      await FirebaseAutentication().signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
        thenValue: event.thenValue,
      );
      emit(IsLoading(isLoading: false));
      emit(LoggedInState(isLoading: false, isSuccess: true));
    } on FirebaseAuthException catch (e) {
      emit(LoggedOutState(isLoading: false, isSuccess: false));
      event.onFail('Erro ao tentar fazer login');
      print('LOG:[ERRO AO TENTAR FAZER LOGIN. ERRO: ${e.toString()}]');
    }
  }

  Future<void> _loggedOut(LoggedOutEvent event, Emitter<AuthState> emit) async {
    emit(LoggedOutState(isLoading: true, isSuccess: false));
    try {
      await FirebaseAutentication().signOut();
      emit(LoggedOutState(isLoading: false, isSuccess: true));
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  Future<void> _register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(LoggedOutState(isLoading: true, isSuccess: false));
    emit(IsLoading(isLoading: true));

    try {
      await FirebaseAutentication().createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
          thenValue: event.thenValue);
      emit(LoggedInState(isLoading: false, isSuccess: true));
      emit(IsLoading(isLoading: false));
    } on FirebaseAuthException catch (e) {
      emit(LoggedOutState(isLoading: false, isSuccess: false));
      event.onFail('Erro ao realizar cadastro');
      print('LOG:[ERRO AO TENTAR CRIAR NOVO USUÁRIO. ERRO: ${e.toString()}]');
    }
  }
}
