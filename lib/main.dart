import 'package:flutter/material.dart';
import 'package:flutter_app_homework/signup/screen/sign_up_screen.dart';

import 'notelist/screen/note_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sign Up",
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      home: NoteListScreen(),
    );
  }
}
