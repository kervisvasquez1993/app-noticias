import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Paginas(),
      bottomNavigationBar: _Botton_navigation_bar(),
    );
  }
}

class _Botton_navigation_bar extends StatelessWidget {
  const _Botton_navigation_bar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex: 0, items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.person_outline), title: Text('titulo')),
      BottomNavigationBarItem(
          icon: Icon(Icons.public), title: Text('Encabezado'))
    ]);
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics:
          NeverScrollableScrollPhysics(), // para bloquear el desplazamiento
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}
