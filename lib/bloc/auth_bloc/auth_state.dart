import 'package:flutter/foundation.dart';

class AuthState {
  final bool isSignedInWithEmailPassword;
  final String email;

  AuthState({
    @required this.isSignedInWithEmailPassword,
    @required this.email,
  });

  factory AuthState.initial() {
    return AuthState(
      isSignedInWithEmailPassword: false,
      email: '',
    );
  }

  AuthState copyWith({
    bool isSignedInWithEmailPassword,
    String email,
  }) {
    return AuthState(
      isSignedInWithEmailPassword:
          isSignedInWithEmailPassword ?? this.isSignedInWithEmailPassword,
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return '''AuthState {
      isSignedInWithEmailPassword: $isSignedInWithEmailPassword,
      email: $email
    }''';
  }
}
