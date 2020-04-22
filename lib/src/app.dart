import 'package:car_booking/src/blocs/auth_bloc.dart';
import 'package:car_booking/src/resources/login_page.dart';
import 'package:car_booking/src/resources/register_page.dart';
import 'package:flutter/material.dart';

class MyApp extends InheritedWidget {

  final AuthBloc authBloc;
  final Widget child;
  MyApp(this.authBloc, this.child) : super(child:child);
  
  // @override 
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: LoginPage(),
  //   );
  // }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }

  static MyApp of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyApp>();
  }
}