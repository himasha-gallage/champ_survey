import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../entities/barrell.dart';
import 'dart:convert';
import '../exceptions/exceptions.dart';

class AuthRepository {
  Future<bool> signInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    //logic to connct backend
    const loginUrl =
        'https://b06c8329-a75d-4706-a112-40a35c5d0d56.mock.pstmn.io/login';

    var loginResponse = await http.post(loginUrl,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            <String, dynamic>{'email': email, 'password': password}));

    //acion acording to response
    if (loginResponse.statusCode == 200) {
      //returns bool value form mock API
      return true;
    } else {
      throw AuthenticationException(message: 'Wrong username or password');
    }
  }
}
