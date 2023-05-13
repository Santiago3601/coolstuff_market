class Producto {
  int? id;
  String? titulo;
  int? precio;
  int? categoria;
  int? estado;
  String? descripcion;
  int? idVendedor;
  String? imagen;
  int? status;

  Producto(this.id, this.titulo, this.precio, this.categoria, this.estado,
      this.descripcion, this.idVendedor, this.imagen, this.status);

  Producto.noId(this.titulo, this.precio, this.categoria, this.estado,
      this.descripcion, this.idVendedor, this.imagen, this.status);

  Producto.empty();

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      json['id'],
      json['titulo'],
      json['precio'],
      json['categoria'],
      json['estado'],
      json['descripcion'],
      json['idVendedor'],
      json['imagen'],
      json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'precio': precio,
      'categoria': categoria,
      'estado': estado,
      'descripcion': descripcion,
      'idVendedor': idVendedor,
      'imagen': imagen,
      'status': status,
    };
  }
}
