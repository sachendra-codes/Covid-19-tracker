import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'datasource.dart';
import 'homepage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        data: (brightness) => ThemeData(
          fontFamily: "Circular",
          primaryColor: primaryBlack,
          scaffoldBackgroundColor: brightness==Brightness.dark?Colors.blueGrey[700]:Colors.white,
          brightness:brightness==Brightness.light?Brightness.light:Brightness.dark,
        ),
    themedWidgetBuilder: (context, theme) {
    return
      MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: HomePage(),
    );
  });
}}
