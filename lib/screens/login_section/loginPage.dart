import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey/bloc/auth_bloc/barrell.dart';
import 'package:survey/screens/common_widgets/bezierContainer.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  AuthBloc _authBloc;

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Cha',
          style: GoogleFonts.portLligatSans(
            // ignore: deprecated_member_use
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'mpSo',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'ft',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  //  _title(),
                  SizedBox(height: 50),
                  Form(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email address',
                              filled: true,
                              isDense: true,
                            ),
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            validator: (value) {
                              if (value == null) {
                                return 'Email is required.';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              filled: true,
                              isDense: true,
                            ),
                            obscureText: true,
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null) {
                                return 'Password is required.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          RaisedButton(
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(16),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8.0)),
                              child: Text('LOG IN'),
                              onPressed: () => {
                                    _authBloc.add(SignInWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text))
                                  })
                        ],
                      ),
                    ),
                  ),
                  // Column(
                  //   children: <Widget>[
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     Text(
                  //       "email",
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold, fontSize: 15),
                  //     ),
                  //     SizedBox(
                  //       height: 10,
                  //     ),
                  //     TextField(
                  //         controller: _emailController,
                  //         obscureText: false,
                  //         decoration: InputDecoration(
                  //             border: InputBorder.none,
                  //             fillColor: Color(0xfff3f3f4),
                  //             filled: true))
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     Text(
                  //       "password",
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold, fontSize: 15),
                  //     ),
                  //     SizedBox(
                  //       height: 10,
                  //     ),
                  //     TextField(
                  //         controller: _passwordController,
                  //         obscureText: true,
                  //         decoration: InputDecoration(
                  //             border: InputBorder.none,
                  //             fillColor: Color(0xfff3f3f4),
                  //             filled: true))
                  //   ],
                  // ),
                  //   ],
                  // ),
                  // SizedBox(height: 20),
                  // RaisedButton(
                  //     color: Theme.of(context).primaryColor,
                  //     textColor: Colors.black,
                  //     padding:
                  //         EdgeInsets.symmetric(vertical: 15, horizontal: 150),
                  //     shape: new RoundedRectangleBorder(
                  //         borderRadius: new BorderRadius.circular(8.0)),
                  //     child: Text('LOG IN'),
                  //     onPressed: () => () => {
                  //           print("Click event on Container"),
                  //           () => {
                  //                 _authBloc.add(SignInWithEmailAndPassword(
                  //                     email: _emailController.text,
                  //                     password: _passwordController.text))
                  //               }
                  //         }),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: height * .055),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
