import 'package:artis_app/widgets/shared/ArtisDrawer.dart';
import 'package:flutter/material.dart';
import 'package:artis_app/widgets/shared/ArtisLogo.dart';
import 'package:artis_app/widgets/shared/ArtisIso.dart';
import 'package:intl/intl.dart';
import 'package:artis_app/utils/my_date_picker.dart' as myDatePicker;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:artis_app/utils/validators.dart';

/// Clase que crea la pantalla de creación de un nuevo usuario
/// 
/// Crea una pantalla con un formulario para completar por el nuevo usuario. Tiene validación de campos obligatorios
class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  /// GlobalKey del formulario de creación de usuario
  GlobalKey<FormState> _keyFormCreateUser = GlobalKey<FormState>();
  
  /// GlobalKey del scaffold de la pantalla de creación de usuario
  GlobalKey<ScaffoldState> _keyScaffoldCreateUser = GlobalKey<ScaffoldState>();

  /// Controlador para el campo name del formulario
  TextEditingController _nameController = TextEditingController();

  /// Controlador para el campo surname del formulario
  TextEditingController _surnameController = TextEditingController();

  /// Controlador para el campo pseudonym del formulario
  TextEditingController _pseudonymController = TextEditingController();

  /// Controlador para el campo occupation del formulario
  TextEditingController _occupationController = TextEditingController();

  /// Controlador para el campo email del formulario
  TextEditingController _emailController = TextEditingController();

  /// Controlador para el campo password del formulario
  TextEditingController _passwordController = TextEditingController(); 

  /// Controlador para el campo birthdate del formulario 
  TextEditingController _birthdateController = TextEditingController();  

  /// Controlador para el campo facebook del formulario
  TextEditingController _facebookController = TextEditingController(); 

  /// Controlador para el campo instagram del formulario
  TextEditingController _instagramController = TextEditingController(); 

  /// Controlador para el campo twitter del formulario
  TextEditingController _twitterController = TextEditingController(); 
  
  /// Propiedad privada de tipo String para guardar el pais seleccionado por el usuario
  String _selectionCountry;

  /// Propiedad privada de tipo String para guardar el idioma seleccionado por el usuario
  String _selectionLanguage;

  /// Lista de paises disponibles para seleccionar por el usuario
  List<String> _countries = ['Argentina', 'Brasil', 'Chile', 'Colombia', 'España', 'Estados Unidos', 'Italia', 'Portugal', 'Suiza'];

  /// Lista de lenguajes dispoibles para seleccionar por el usuario
  List<String> _languages = ['Español', 'Inglés', 'Italiano'];


  /// Función para seleccionar la fecha de nacimiento
  /// 
  /// Esta función muestra un DatePicker modificado para el proyecto que se llama myDatePicker. Tiene la capacidad
  /// de cerrarse solo al seleccionar una fecha sin la necesidad que el usuario acepte la pantalla
  Future<DateTime> _selectDate() async {
    DateTime picked = await myDatePicker.showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now()
    );
    _birthdateController.text = DateFormat('dd/MM/yyyy').format(picked);

    return picked;
  }

  /// Función que guarda los datos del usuario creado en el formulario y redirije a la landing correspondiente
  /// 
  /// Por el momento solo muestra un SnackBar, cuando esté disponible el backend guardará en el mismo antes de redirigir a su landing
  void _saveProfile() {
    String texto = """${_nameController.text} - ${_surnameController.text} - ${_pseudonymController.text} - ${_selectionCountry} - ${_selectionLanguage} - ${_occupationController.text} 
    - ${_emailController.text} - ${_passwordController.text} - ${_birthdateController.text} - ${_facebookController.text} - ${_instagramController.text} - ${_twitterController.text}""";
    _keyScaffoldCreateUser.currentState.showSnackBar(SnackBar(content: Text(texto)));
     Navigator.pushNamed(context, '/landingLogged');
  } 

  /// Función que valida el formulario
  /// 
  /// Función privada que ejecuta la validación de cada campo del formulario

  void _validateFormUser() {
    if(_keyFormCreateUser.currentState.validate()) {
      print('Form valido');
      _saveProfile();
    } else {
      print('Form invalido');
    }
  }


 @override
 Widget build(BuildContext context) {
   double _paddingHorizonal = MediaQuery.of(context).size.width * 0.07;

  return Scaffold(
    key: _keyScaffoldCreateUser,
    appBar: AppBar(
      title: Text('Crear usuario'),
    ),
    body: ListView(
      children: <Widget>[        
        Form(
        key: _keyFormCreateUser,
        child: Column(          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: ArtisLogo(aWidth: 80),
            ),
            ArtisIso(aFontSize: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _paddingHorizonal),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Name',                      
                    ),
                    validator: (String value) => validateUser(value),
                  ),
                  TextFormField(
                    controller: _surnameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today, color: Colors.white),
                      labelText: 'Surname',
                    ),
                    validator: (String value) => validateSurname(value),
                  ),
                  TextFormField(
                    controller: _pseudonymController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today, color: Colors.white),
                      labelText: 'Pseudonym'
                    ),
                  ),
                  DropdownButtonFormField(
                    value: _selectionCountry,
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_on),
                      labelText: 'Country'
                    ),
                    onChanged: (newValue) {
                      setState((){
                        _selectionCountry = newValue;
                      });
                    },
                    items: _countries.map((loc) {
                      return DropdownMenuItem(
                        child: Text(loc),
                        value: loc
                      );
                    }).toList(),
                    validator: (String value) => validateCountry(value)
                  ),
                  DropdownButtonFormField(
                    value: _selectionLanguage,
                    decoration: InputDecoration(
                      icon: Icon(Icons.language),
                      labelText: 'Language'
                    ),
                    onChanged: (newValue) {
                      setState((){
                        _selectionLanguage = newValue;
                      });
                    },
                    items: _languages.map((loc) {
                      return DropdownMenuItem(
                        child: Text(loc),
                        value: loc
                      );
                    }).toList(),
                    validator: (String value) => validateLanguage(value)
                  ),
                  TextFormField(
                    controller: _occupationController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: Icon(Icons.work),
                      labelText: 'Occupation'
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(Icons.alternate_email),
                      labelText: 'E-Mail'
                    ),
                    validator: (String value) => validateEmail(value),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: 'Password'
                    ),
                    validator: (String value) => validatePass(value),
                  ),                  
                  InkWell(
                    onTap: () {
                      _selectDate(); 
                    },
                    child: IgnorePointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today),
                          labelText: 'Birthdate'),
                        controller: _birthdateController,
                        validator: (String value) => validateDate(value)
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _facebookController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: Icon(MdiIcons.fromString('facebook')),
                      labelText: 'Facebook'                      
                    ),
                  ),
                  TextFormField(
                    controller: _instagramController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: Icon(MdiIcons.fromString('instagram')),
                      labelText: 'Instagram'
                    ),
                  ),
                  TextFormField(
                    controller: _twitterController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: Icon(MdiIcons.fromString('twitter')),
                      labelText: 'Twitter'
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RaisedButton(
                    child: Text('Save profile'),
                    onPressed: _validateFormUser
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              )
            )
          ]
        )
      )
      ],
    ),
    drawer: ArtisDrawer(),
  );
 }

 @override
 void dispose() {
   super.dispose();
   _nameController.dispose();
   _surnameController.dispose();
   _pseudonymController.dispose();
   _occupationController.dispose();
   _emailController.dispose();
   _passwordController.dispose();
   _birthdateController.dispose();
   _facebookController.dispose();
   _instagramController.dispose();
   _twitterController.dispose();

 }
}