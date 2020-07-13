import 'package:flutter/material.dart';
import 'package:noticias/src/page/tabs_dart.dart';
import 'package:noticias/src/services/news_services.dart';
import 'package:noticias/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsServices(),
        )
      ],
      child: MaterialApp(
        title: 'App Noticias',
        theme: mitheme,
        debugShowCheckedModeBanner: false,
        home: TabsPage(),
      ),
    );
  }
}
