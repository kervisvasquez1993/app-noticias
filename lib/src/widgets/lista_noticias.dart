import 'package:flutter/material.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:noticias/src/theme/theme.dart';

class ListaNoticia extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticia(this.noticias); // forma posicional
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.noticias.length,
        itemBuilder: (BuildContext context, int index) {
          return _Noticias(noticias: this.noticias[index], index: index);
        });
  }
}

class _Noticias extends StatelessWidget {
  @required
  final Article noticias;
  @required
  final int index;

  const _Noticias({Key key, this.noticias, this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_TargetaToBar(noticias, index)],
    );
  }
}

class _TargetaToBar extends StatelessWidget {
  final Article noticia;
  final int index;
  const _TargetaToBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}. ',
            style: TextStyle(color: mitheme.accentColor),
          ),
          Text('${noticia.source.name}'),
        ],
      ),
    );
  }
}
