import 'package:flutter/foundation.dart';

class AuthState {
  final bool isSignedIn;
  final String email;

  AuthState({
    @required this.isSignedIn,
    @required this.email,
  });

  factory AuthState.initial() {
    return AuthState(
      isSignedIn: false,
      email: '',
    );
  }

  AuthState copyWith({
    bool isSignedIn,
    String email,
  }) {
    return AuthState(
      isSignedIn: isSignedIn ?? this.isSignedIn,
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return '''AuthState {
      isSignedIn: $isSignedIn,
      email: $email
    }''';
  }
}
