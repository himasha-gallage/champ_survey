import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../entities/barrell.dart';
import 'auth_event.dart';
import 'barrell.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../exceptions/exceptions.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({@required User me});

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
    //logic to connct backend
    const loginUrl =
        'https://b06c8329-a75d-4706-a112-40a35c5d0d56.mock.pstmn.io/login';

    var loginResponse = await http.post(loginUrl,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            <String, dynamic>{'email': state.email, 'password': password}));

    //acion acording to response
    if (loginResponse.statusCode == 200) {
    } else {
      throw AuthenticationException(message: 'Wrong username or password');
    }

    try {} catch (e) {
      print(e);
    }
  }
}
