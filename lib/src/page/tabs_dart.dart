import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Botton_navigation_bar(),
      ),
    );
  }
}

class _Botton_navigation_bar extends StatelessWidget {
  const _Botton_navigation_bar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(
        context); // esto es como si fuera un singleton
    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: [
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
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      // controllers : // TODO ???
      controller: navegacionModel.pageController,

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

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();
  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);

    /// ??? procedimiento //
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
