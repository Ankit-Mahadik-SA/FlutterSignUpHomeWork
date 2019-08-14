import 'package:flutter/material.dart';

class SocialLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        _buildSocialLoginTextWidget(context),
        Row(
          children: <Widget>[
            __buildFacebookButtonWidget(context),
            __buildTwitterButtonWidget(context)
          ],
        )
      ],
    );
  }

  Widget _buildSocialLoginTextWidget(BuildContext context) {
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
              text: 'Or sign up with social account',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget __buildTwitterButtonWidget(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: RaisedButton(
            color: Color.fromRGBO(29, 161, 242, 1.0),
            child: Image.asset(
              "assets/images/ic_twitter.png",
              width: 25,
              height: 25,
            ),
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0))),
      ),
    );
  }

  Widget __buildFacebookButtonWidget(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: RaisedButton(
            color: Color.fromRGBO(42, 82, 151, 1.0),
            child: Image.asset(
              "assets/images/ic_fb.png",
              width: 35,
              height: 35,
            ),
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0))),
      ),
    );
  }
}
