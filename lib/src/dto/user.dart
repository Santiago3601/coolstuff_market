class UserApp {
  int? _id;
  String? _nombre;
  int? _telefono;
  String? _direccion;
  String? _ciudad;
  String? _fecha_nacimiento;
  String? _email;
  String? _contrasena;
  String? _imagen;
  String? _comentario;

  UserApp(this._id,this._nombre, this._telefono, this._direccion, this._ciudad, this._fecha_nacimiento, this._email, this._contrasena, this._imagen,this._comentario);
  UserApp.noId(this._nombre, this._telefono, this._direccion, this._ciudad, this._fecha_nacimiento, this._email, this._contrasena, this._imagen,this._comentario);
  UserApp.noMailOrPassword(this._id,this._nombre, this._telefono, this._direccion, this._ciudad, this._fecha_nacimiento, this._imagen,this._comentario);

  UserApp.empty();

  factory UserApp.fromJson(Map<String, dynamic> json) {
    return UserApp(
      json['id'],
      json['nombre'],
      json['telefono'],
      json['direccion'],
      json['ciudad'],
      json['fecha_nacimiento'],
      json['email'],
      json['contrasena'],
      json['imagen'],
      json['comentario'],
    );
  }
  int? id() => _id;
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
    'id': _id,
    'nombre': _nombre,
    'telefono': _telefono,
    'direccion': _direccion,
    'ciudad': _ciudad,
    'fecha_nacimiento': _fecha_nacimiento,
    'email': _email,
    'contrasena': _contrasena,
    'imagen': _imagen,
    'comentario': _comentario,
  };

}


