
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  
  bool validateText(String value) {
    if(value.isEmpty && value.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  String validateUser(String value) {
    if(!validateText(value)) {
      return 'Ingrese el usuario correctamente';
    } else {
      return null;
    }
  }

  String validatePass(String value) {
    if(!validateText(value)) {
      return 'Ingrese el password correctamente';
    } else {
      return null;
    }
  }

  String validateName(String value) {
    if(!validateText(value)) {
      return 'Ingrese el nombre correctamente';
    } else {
      return null;
    }
  }

  String validateSurname(String value) {
    if(!validateText(value)) {
      return 'Ingrese el apellido correctamente';
    } else {
      return null;
    }
  }

  String validateCountry(String value) {
    print('Desde validateCountry: $value');
    if(value == null) {
      return 'Seleccione un pais';
    } else {
      return null;
    }
  }

  String validateLanguage(String value) {
    if(value == null) {
      return 'Seleccione un idioma';
    } else {
      return null;
    }
  }

  String validateDate(String value) {
    if(!validateText(value)) {
      return 'Seleccione una fecha';
    } else {
      return null;
    }
  }