import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MainPage.dart';

void main() {
  /// 상태바 색상 변경
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(systemOverlayStyle:SystemUiOverlayStyle.light,)
      ),
      home: MainPage(),
    );
  }
}
