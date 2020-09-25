import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login_section/welcomePage.dart';
import 'bloc/auth_bloc/barrell.dart';
import 'bloc/survey_bloc/barrell.dart';
import 'bloc/simple_bloc_delegate.dart';
import 'entities/barrell.dart';
import './repository/barrell.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        ),
      ),
      // home: WelcomePage(),
      home: MultiProvider(
        providers: [
          Provider<User>(
            create: (BuildContext context) => User(),
          ),
        ],
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<AuthRepository>(
              create: (BuildContext context) => AuthRepository(),
            ),
            RepositoryProvider<SurveyRepository>(
              create: (BuildContext context) => SurveyRepository(),
            ),
          ],
          child: MultiBlocProvider(providers: [
            BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc(
                me: Provider.of<User>(context, listen: false),
                authRepo: RepositoryProvider.of<AuthRepository>(context),
              ),
            ),
          ], child: null),
        ),
      ),
    );
  }
}
