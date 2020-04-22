import 'package:car_booking/src/app.dart';
import 'package:car_booking/src/resources/home_page.dart';
import 'package:car_booking/src/resources/loading_dialog.dart';
import 'package:car_booking/src/resources/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //backgroundColor: Color(0xff888888),
      body: Container(
        constraints: BoxConstraints.expand(),
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
                'ic_car_green.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
              child: Text(
                "Welcome back!",
                style: TextStyle(fontSize: 22, color: Color(0xff333333)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Text(
                'Login to continue using app',
                style: TextStyle(fontSize: 15, color: Color(0xff555555)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                height: 50.0,
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(fontSize: 15, color: Color(0xff555555)),
                  decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Container(
                        width: 10,
                        child: Image.asset('ic_mail.png'),
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                height: 50.0,
                child: TextField(
                  controller: _passController,
                  style: TextStyle(fontSize: 15, color: Color(0xff555555)),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Container(
                        width: 10,
                        child: Image.asset('ic_lock.png'),
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      child: new AlertDialog(
                        title: Text("Thôi xong"),
                        content:
                            Text("quên pass thì chịu th reset kiểu chi đc"),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            child: Text('chịu'),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text('oke'),
                          ),
                        ],
                      )),
                  child: Text(
                    'Forgot password ?',
                    style: TextStyle(fontSize: 12, color: Color(0xff888888)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                onPressed: _onLoginClick,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Text(
                  'Log In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: RichText(
                text: TextSpan(
                    text: 'New user? ',
                    style: TextStyle(fontSize: 13, color: Color(0xff888888)),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                          text: "Sign up for a new account",
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
    );
  }

  void _onLoginClick() {
    String email = _emailController.text;
    String pass = _passController.text;
    var authBloc = MyApp.of(context).authBloc;
    LoadingDialog.showLoadingDialog(context, 'Loading...');
    authBloc.signIn(email, pass, () {
      LoadingDialog.hideLoadingDialog(context);
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => HomePage()));
      Navigator.of(context).pushReplacementNamed('/home');
    }, (msg) {
     
    });
  }
}
