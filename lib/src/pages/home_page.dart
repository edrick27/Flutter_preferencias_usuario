import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class HomePage extends StatefulWidget {
  static final String routeName = 'home';

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _prefs = new PreferenciasUsuarios();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _prefs.ultimaPagina = 'home';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: _prefs.color ? Colors.teal :  Colors.blue,
      ),
      drawer: MenuDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color secundario ${_prefs.color}"),
          Divider(),
          Text("Género: ${_prefs.genero}"),
          Divider(),
          Text("Nombre de usuario: ${_prefs.name}"),
          Divider(),
        ],
      )
    );
  }

}
