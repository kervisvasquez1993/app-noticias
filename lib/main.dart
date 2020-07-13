import 'package:flutter/material.dart';
import 'package:noticias/src/page/tabs_dart.dart';
import 'package:noticias/src/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Noticias',
      theme: mitheme,
      debugShowCheckedModeBanner: false,
      home: TabsPage(),
    );
  }
}
