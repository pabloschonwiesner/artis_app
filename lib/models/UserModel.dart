class UserModel {
  String id;
  String origen;
  String nombre;
  String apellido;
  String email;

  UserModel({this.id, this.origen, this.nombre, this.apellido, this.email}); 

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    origen = json['origen'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['origen'] = this.origen;
    data['nombre'] = this.nombre;
    data['apellido'] = this.apellido;
    data['email'] = this.email;

    return data;
   }


}