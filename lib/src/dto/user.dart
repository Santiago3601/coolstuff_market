class UserApp {
  String? _nombre;
  int? _telefono;
  String? _direccion;
  String? _ciudad;
  String? _fecha_nacimiento;
  String? _email;
  String? _contrasena;
  String? _imagen;
  String? _comentario;
  UserApp(this._nombre, this._telefono, this._direccion, this._ciudad, this._fecha_nacimiento, this._email, this._contrasena, this._imagen,this._comentario);

  UserApp.empty();

  factory UserApp.fromJson(Map<String, dynamic> json) {
    return UserApp(
      json['_nombre'],
      json['_telefono'],
      json['_direccion'],
      json['_ciudad'],
      json['_fecha_nacimiento'],
      json['_email'],
      json['_contrasena'],
      json['_imagen'],
      json['_comentario'],
    );
  }

  String? nombre() => _nombre;
  int? telefono() => _telefono;
  String? direccion() => _direccion;
  String? ciudad() => _ciudad;
  String? fecha_nacimiento() => _fecha_nacimiento;
  String? email() => _email;
  String? contrasena() => _contrasena;
  String? imagen() => _imagen;
  String? comentario() => _comentario;
  Map toJson() => {

    'NOMBRE': _nombre,
    'TELEFONO': _telefono,
    'DIRECCION': _direccion,
    'CIUDAD': _ciudad,
    'FECHA_NACIMIENTO': _fecha_nacimiento,
    'EMAIL': _email,
    'CONTRASENA': _contrasena,
    'IMAGEN': _imagen
  };


}

