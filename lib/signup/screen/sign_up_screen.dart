import 'package:flutter/material.dart';
import 'package:flutter_app_homework/signup/widget/sing_up_form_widget.dart';
import 'package:flutter_app_homework/signup/widget/social_login_widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SignUp"),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SignUpFormWidget(),
              SocialLoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
