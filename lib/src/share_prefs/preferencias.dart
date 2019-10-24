import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuarios {

  static final PreferenciasUsuarios _instancia = new PreferenciasUsuarios._internal();
  
  factory PreferenciasUsuarios(){
    return _instancia;
  }

  PreferenciasUsuarios._internal();
  SharedPreferences _prefs;

  initPreferens() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  //GET Y SET


  get genero {
    return _prefs.getInt("genero") ?? 1;
  }

  set genero(int value){
    _prefs.setInt("genero",value);
  }

  get color{
    return _prefs.getBool("color") ?? false;
  }

  set color(bool value){
    _prefs.setBool("color",value);
  }

  get name{
    return _prefs.getString("name") ?? " ";
  }

  set name(String value){
    _prefs.setString("name",value);
  }

  get ultimaPagina{
    return _prefs.getString("ultimaPagina") ?? "home";
  }

  set ultimaPagina(String value){
    _prefs.setString("ultimaPagina",value);
  }

}