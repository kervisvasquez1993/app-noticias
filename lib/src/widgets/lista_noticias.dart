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

  const _Noticias({this.noticias, this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TargetaToBar(noticias, index),
        _TargetaTitulo(noticias),
        _TargetaImagen(noticias),
        _TargetaBody(noticias),
        _TargetaBotones(),
        SizedBox(height: 10),
        Divider(),
      ],
    );
  }
}

class _TargetaBotones extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
          
            onPressed: (){},
              fillColor: mitheme.accentColor,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),    
              child: Icon(Icons.star_border),
          ),

          SizedBox(width:20),
          
          RawMaterialButton(
          
            onPressed: (){},
              fillColor: Colors.blue,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),    
              child: Icon(Icons.more),
          ),
        ],
      )
    );
  }
}

class _TargetaBody extends StatelessWidget {
  final Article noticias;
  const _TargetaBody(this.noticias);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text((noticias.description != null )? noticias.description : '' )
    );
  }
}

class _TargetaImagen extends StatelessWidget {

  final Article noticias;

  const _TargetaImagen(this.noticias);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:20),
      child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(50), bottomRight: Radius.circular(50)),
            child: Container(
         child: (noticias.urlToImage != null)
          ?
            FadeInImage(
                  placeholder: AssetImage('assets/giphy.gif'),
                  image: NetworkImage(noticias.urlToImage),
             )
          :
          Image(image:AssetImage('assets/no-image.png'))
        ),
      ),
    );
  }
}

class _TargetaTitulo extends StatelessWidget {
  final Article noticias;

  const _TargetaTitulo(this.noticias);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:15),
      child: Text(noticias.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
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
