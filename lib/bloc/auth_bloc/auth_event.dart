import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]);
}

class SignInWithEmailAndPassword extends AuthEvent {
  final String password;
  final String email;

  SignInWithEmailAndPassword({
    @required this.password,
    this.email,
  });

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  String toString() => 'Signing In with Email/Password';
}
