import 'package:car_booking/src/blocs/auth_bloc.dart';
import 'package:car_booking/src/resources/home_page.dart';
import 'package:car_booking/src/resources/loading_dialog.dart';
import 'package:car_booking/src/resources/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthBloc authBloc = new AuthBloc();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override 
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //backgroundColor: Color(0xff888888),
      body: SingleChildScrollView(
        child: Container(
          //constraints: BoxConstraints.expand(),
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(90, 0, 90, 0),
                child: Image.asset(
                  'ic_car_red.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                  "Welcome Aboard!",
                  style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Text(
                  'Signup with iCab in simple steps',
                  style: TextStyle(fontSize: 15, color: Color(0xff555555)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                  height: 50.0,
                  child: StreamBuilder(
                    stream: authBloc.nameStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _nameController,
                        style: TextStyle(fontSize: 15, color: Color(0xff555555)),
                        decoration: InputDecoration(
                            labelText: 'Name',
                            errorText: snapshot.hasError ? snapshot.error : null,
                            prefixIcon: Container(
                              width: 10,
                              child: Image.asset('ic_user.png'),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      );
                    }
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                  height: 50.0,
                  child: StreamBuilder(
                    stream: authBloc.phoneStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _phoneController,
                        style: TextStyle(fontSize: 15, color: Color(0xff555555)),
                        decoration: InputDecoration(
                            labelText: 'Phone',
                            errorText: snapshot.hasError ? snapshot.error : null,
                            prefixIcon: Container(
                              width: 10,
                              child: Image.asset('ic_phone.png'),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      );
                    }
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                  height: 50.0,
                  child: StreamBuilder(
                    stream: authBloc.emailStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _emailController,
                        style: TextStyle(fontSize: 15, color: Color(0xff555555)),
                        decoration: InputDecoration(
                            labelText: 'Email',
                            errorText: snapshot.hasError ? snapshot.error : null,
                            prefixIcon: Container(
                              width: 10,
                              child: Image.asset('ic_mail.png'),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      );
                    }
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                  height: 50.0,
                  child: StreamBuilder(
                    stream: authBloc.passStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _passwordController,
                        style: TextStyle(fontSize: 15, color: Color(0xff555555)),
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            errorText: snapshot.hasError ? snapshot.error : null,
                            prefixIcon: Container(
                              width: 10,
                              child: Image.asset('ic_lock.png'),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      );
                    }
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: RaisedButton(
                  onPressed: onResClicked,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: RichText(
                  text: TextSpan(
                      text: 'Already a user? ',
                      style: TextStyle(fontSize: 13, color: Color(0xff888888)),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                            text: "Login now",
                            style: TextStyle(color: Colors.blue, fontSize: 13))
                      ]),
                ),
              )
              // Row(
              //   children: <Widget>[
              //     Text(
              //       'dont have account?',
              //       style: TextStyle(fontSize: 12, color: Color(0xff888888)),
              //     ),
              //     GestureDetector(
              //       onTap: () {},
              //       child: Text(
              //         'create one !',
              //         style: TextStyle(color: Colors.blue, fontSize: 12),
              //       ),
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void onResClicked() {
    if (authBloc.isValid(_nameController.text, _emailController.text, _passwordController.text, _phoneController.text)) {
      LoadingDialog.showLoadingDialog(context, 'Loading...');
      authBloc.signUp(_emailController.text, _passwordController.text, _nameController.text, _phoneController.text, () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      },(msg) {
        LoadingDialog.hideLoadingDialog(context);
      });
    } else {
      print('something wrong!');
    }
  }
}
