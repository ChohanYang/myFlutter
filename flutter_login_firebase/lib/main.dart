import 'package:flutter/material.dart';
import 'package:untitled3/data/JoinOrLogin.dart';
import 'package:untitled3/screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  ChangeNotifierProvider<JoinOrLogin>.value(
        value: JoinOrLogin(),
        child: AuthPage()),
      );
  }
}
