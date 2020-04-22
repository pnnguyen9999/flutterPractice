
import 'package:car_booking/src/app.dart';
import 'package:car_booking/src/blocs/auth_bloc.dart';
import 'package:car_booking/src/resources/home_page.dart';
import 'package:car_booking/src/resources/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp(new AuthBloc(), MaterialApp(
  home: LoginPage(),
  routes: <String, WidgetBuilder>{
    '/home': (BuildContext context) => new HomePage(),
    '/login': (BuildContext context) => new LoginPage()
  },
)));