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
        event.password,
      );
    }
    throw UnimplementedError();
  }

  Stream<AuthState> _mapSignInWithEmailAndPasswordToState(
    String password,
  ) async* {
    print('$password');

    bool _result = await _authRepo.signInWithEmailAndPassword(
      email: state.email,
      password: password.replaceAll("'", "\u0027"),
    );

    if (_result) {
      _me.email = state.email;
    }
  }
}
