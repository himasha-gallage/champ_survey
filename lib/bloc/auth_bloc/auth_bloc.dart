import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../entities/barrell.dart';
import 'auth_event.dart';
import 'barrell.dart';
import '../../repository/barrell.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    @required User me,
    @required AuthRepository authRepo,
  }) : _authRepo = authRepo;

  User _me;
  final AuthRepository _authRepo;

  @override
  AuthState get initialState => AuthState.initial();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignInWithEmailAndPassword) {
      yield* _mapSignInWithEmailAndPasswordToState(
        event.email,
        event.password,
      );
    }
    throw UnimplementedError();
  }

  Stream<AuthState> _mapSignInWithEmailAndPasswordToState(
    String email,
    String password,
  ) async* {
    bool _result = await _authRepo.signInWithEmailAndPassword(
        email: email, password: password);

    if (_result) {
      _me.email = state.email;
    }
  }
}
