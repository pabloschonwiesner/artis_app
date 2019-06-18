import 'package:shared_preferences/shared_preferences.dart';
import 'package:artis_app/models/UserModel.dart';

void initSession(UserModel user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('id', user.id);
  await prefs.setString('origen', user.origen);
  await prefs.setString('nombre', user.nombre);
  await prefs.setString('apellido', user.apellido);
  await prefs.setString('email', user.email);
}

void closeSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('id', '';
  await prefs.setString('origen', '');
  await prefs.setString('nombre', '');
  await prefs.setString('apellido', '');
  await prefs.setString('email', '');
}

UserModel getSession() {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String id;
  String origen;
  String nombre;
  String apellido;
  String email;
  id = prefs.getString('id');
  origen = prefs.getString('origen');
  nombre = prefs.getString('nombre');
  apellido = prefs.getString('apellido');
  email = prefs.getString('email');
  return UserModel(id: id, origen: origen, nombre: nombre, apellido: apellido, email: email);

}