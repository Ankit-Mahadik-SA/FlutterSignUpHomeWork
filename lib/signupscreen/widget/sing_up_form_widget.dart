import 'package:flutter/material.dart';
import 'package:flutter_app_homework/style/common_styles.dart';

class SignUpFormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpFormWidgetState();
  }
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _formKey = GlobalKey<FormState>();

  var _userNameController = TextEditingController(text: "");
  var _userEmailController = TextEditingController(text: "");
  var _userPasswordController = TextEditingController(text: "");

  var _emailFocusNode = FocusNode();
  var _passwordFocusNode = FocusNode();
  bool _isPasswordVisible = true;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        children: <Widget>[
          _buildUserNameField(context),
          _buildEmailField(context),
          _buildPasswordField(context),
          _buildTermsWidget(context),
          _buildSignUpButton(context),
        ],
      ),
    );
  }

  Widget _buildUserNameField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: _userNameController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_emailFocusNode);
        },
        validator: (value) => _userNameValidation(value),
        decoration: CommonStyles.textFormFieldStyle("User Name", ""),
      ),
    );
  }

  String _userNameValidation(String value) {
    if (value.isEmpty) {
      return "Please enter valid user name";
    } else {
      return null;
    }
  }

  Widget _buildEmailField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: _userEmailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        validator: (value) => _emailValidation(value),
        decoration: CommonStyles.textFormFieldStyle("Email", ""),
      ),
    );
  }

  String _emailValidation(String value) {
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    if (!emailValid) {
      return "Enter valid email address";
    } else {
      return null;
    }
  }

  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: _userPasswordController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_emailFocusNode);
        },
        validator: (value) => _userNameValidation(value),
        obscureText: _isPasswordVisible,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "",
          labelStyle: TextStyle(color: Colors.black),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              }),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildTermsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: RichText(
        text: new TextSpan(
          style: new TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Terms of use',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: ' and ',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: 'Privacy policy',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.black,
        onPressed: () {
          _signUpProcess(context);
        },
        child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  void _signUpProcess(BuildContext context) {
    var validate = _formKey.currentState.validate();

    if (validate) {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: Text("Sign Up Success."),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      _clearAllFields();
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"))
              ],
            );
          });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void _clearAllFields() {
    setState(() {
      _userNameController = TextEditingController(text: "");
      _userEmailController = TextEditingController(text: "");
      _userPasswordController = TextEditingController(text: "");
    });
  }
}
