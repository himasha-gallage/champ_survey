class User {
  String _email = '';
  String _password = '';

  String get email => _email;
  set email(String email) {
    this._email = email;
  }

  String get password => _password;
  set password(String password) {
    this._password = password;
  }
}
