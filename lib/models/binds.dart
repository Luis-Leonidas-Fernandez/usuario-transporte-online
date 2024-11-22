class Subasta {
  final List<Productos> productos;
  final List<Oferta> ofertas;

  Subasta({
    required this.productos,
    required this.ofertas,
  });

  // Método para convertir un mapa (JSON) en un objeto Subasta
  factory Subasta.fromJson(Map<String, dynamic> json) {
    return Subasta(
      productos: (json['productos'] as List?)?.map((producto) => Productos.fromJson(producto)).toList() ?? [], // Asegurarse de que sea una lista
      ofertas: (json['ofertas'] as List?)?.map((oferta) => Oferta.fromJson(oferta)).toList() ?? [], // Asegurarse de que sea una lista
    );
  }

  // Método para convertir un objeto Subasta en un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'productos': productos.map((producto) => producto.toJson()).toList(),
      'ofertas': ofertas.map((oferta) => oferta.toJson()).toList(),
    };
  }

}

class Productos {

  final String id;
  final String tipoCarga;
  final String peso;
  final String tamano;
  final String estadoSubasta;

  Productos({
    required this.id,
    required this.tipoCarga,
    required this.peso,
    required this.tamano,
    required this.estadoSubasta,
  });

  // Método para convertir un mapa (JSON) en un objeto Producto
  factory Productos.fromJson(Map<String, dynamic> json) {
    return Productos(
      id: json['id'] as String,
      tipoCarga: json['tipoCarga'] as String,
      peso: json['peso'] as String,
      tamano: json['tamaño'] as String,
      estadoSubasta: json['estadoSubasta'] as String,
    );
  }

  // Método para convertir un objeto Producto en un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tipoCarga': tipoCarga,
      'peso': peso,
      'tamaño': tamano,
      'estadoSubasta': estadoSubasta,
    };
  }
}

class Oferta {
  final String idProducto;
  final String name;
  final String domicilio;
  final String licencia;
  final String? oferta; // Puede ser null si no existe
  final String vehiculo;
  final String patente;
  final String modelo;
  final String capacidadDeCarga;

  Oferta({
    required this.idProducto,
    required this.name,
    required this.domicilio,
    required this.licencia,
    this.oferta,
    required this.vehiculo,
    required this.patente,
    required this.modelo,
    required this.capacidadDeCarga,
  });

  // Método para convertir un mapa (JSON) en un objeto Oferta
  factory Oferta.fromJson(Map<String, dynamic> json) {
    return Oferta(
      idProducto: json['idProducto'] as String,
      name: json['name'] as String,
      domicilio: json['domicilio'] as String,
      licencia: json['licencia'] as String,
      oferta: json['oferta'] ?? json['precio'], // Manejo para ambas claves
      vehiculo: json['vehiculo'] as String,
      patente: json['patente'] as String,
      modelo: json['modelo'] as String,
      capacidadDeCarga: json['capacidadDeCarga'] as String,
    );
  }

  // Método para convertir un objeto Oferta en un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'idProducto': idProducto,
      'name': name,
      'domicilio': domicilio,
      'licencia': licencia,
      'oferta': oferta,
      'vehiculo': vehiculo,
      'patente': patente,
      'modelo': modelo,
      'capacidadDeCarga': capacidadDeCarga,
    };
  }
}

