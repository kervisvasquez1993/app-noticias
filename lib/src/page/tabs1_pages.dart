import 'package:flutter/material.dart';
import 'package:noticias/src/services/news_services.dart';
import 'package:noticias/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsServices>(context).headlines;

    return Scaffold(body: ListaNoticia(headlines));
  }
}
