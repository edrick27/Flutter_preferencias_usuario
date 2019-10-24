import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  _SettingsPagePageState createState() => _SettingsPagePageState();
}

class _SettingsPagePageState extends State<SettingsPage> {

  final _prefs = new PreferenciasUsuarios();
  int _valueRadio = 1;
  bool _valueColor = false;
  String _valueName = "pedro";

  TextEditingController _textController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _prefs.ultimaPagina = 'settings';
    _getPreferens();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: _prefs.color ? Colors.teal :  Colors.blue,
        ),
        drawer: MenuDrawer(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text("Settings",
                  style: TextStyle(fontSize: 45.0, color: Colors.black)),
            ),
            Divider(),
            SwitchListTile(
              value: _valueColor,
              title: Text("Color secundario"),
              onChanged: _setSelectColor
            ),
            RadioListTile(
                value: 1,
                title: Text("Masculino"),
                groupValue: _valueRadio,
                onChanged: _setSelectRadio),
            RadioListTile(
              value: 2,
              title: Text("Femenino"),
              groupValue: _valueRadio,
              onChanged: _setSelectRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Nombre", helperText: "nombre de la persona"),
                onChanged: (value) {
                  _setSelectName(value);
                },
                controller: _textController,
              ),
            )
          ],
        ));
  }

  _setSelectColor(bool value) {
    _prefs.color = value;

    setState(() {
      _valueColor = value;
    });
  }

  _setSelectRadio(int value)  {
    _prefs.genero = value;

    setState(() {
      _valueRadio = value;
    });
  }

  _setSelectName(String value) {
    _prefs.name = value;
  }

  _getPreferens() async {
    _valueRadio = _prefs.genero;
    _valueColor = _prefs.color;
    _valueName = _prefs.name;
    _textController = TextEditingController(text: _valueName);
    setState(() {});
  }
}
