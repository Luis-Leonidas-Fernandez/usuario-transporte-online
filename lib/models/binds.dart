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
      productos: (json['productos'] as List?)?.map((producto) => Productos.fromJson(producto)).toList() ?? [],
      ofertas: (json['ofertas'] as List?)?.map((oferta) => Oferta.fromJson(oferta)).toList() ?? [],
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
  final String? id;
  final String? tipoCarga;
  final Peso? peso;
  final Tamano? tamano;
  final Ubicacion? ubicacion;
  final String? prioridad;
  final String? estadoSubasta;

  Productos({
    this.id,
    this.tipoCarga,
    this.peso,
    this.tamano,
    this.ubicacion,
    this.prioridad,
    this.estadoSubasta,
  });

  // Método para convertir un mapa (JSON) en un objeto Producto
  factory Productos.fromJson(Map<String, dynamic> json) {
    return Productos(
      id: json['id'],
      tipoCarga: json['tipoCarga'],
      peso: Peso.fromJson(json['peso']),
      tamano: Tamano.fromJson(json['tamaño']),
      ubicacion: Ubicacion.fromJson(json['ubicacion']),
      prioridad: json['prioridad'],
      estadoSubasta: json['estadoSubasta'],
    );
  }

  // Método para convertir un objeto Producto en un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tipoCarga': tipoCarga,
      'peso': peso!.toJson(),
      'tamaño': tamano!.toJson(),
      'prioridad': prioridad,
      'ubicacion': ubicacion!.toJson(),
      'estadoSubasta': estadoSubasta,
    };
  }
}

class Peso {
  final double? peso;
  final String? unidadPeso;

  Peso({
    this.peso,
    this.unidadPeso,
  });

  factory Peso.fromJson(Map<String, dynamic> json) {
    return Peso(
      peso: json['peso'].toDouble(),
      unidadPeso: json['unidadPeso'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'peso': peso,
      'unidadPeso': unidadPeso,
    };
  }
}

class Tamano {
  final double? alto;
  final double? ancho;
  final double? profundidad;

  Tamano({
    this.alto,
    this.ancho,
    this.profundidad,
  });

  factory Tamano.fromJson(Map<String, dynamic> json) {
    return Tamano(
      alto: json['alto'].toDouble() ?? '',
      ancho: json['ancho'].toDouble() ?? '',
      profundidad: json['profundidad'].toDouble() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'alto': alto,
      'ancho': ancho,
      'profundidad': profundidad,
    };
  }
}

class Oferta {
  final String?idProducto;
  final String? name;
  final Ubicacion? domicilio;
  final String? licencia;
  final Precio? precio;
  final String? vehiculo;
  final String? patente;
  final String? modelo;
  final CapacidadDeCarga? capacidadDeCarga;

  Oferta({
    this.idProducto,
    this.name,
    this.domicilio,
    this.licencia,
    this.precio,
    this.vehiculo,
    this.patente,
    this.modelo,
    this.capacidadDeCarga,
  });

  // Método para convertir un mapa (JSON) en un objeto Oferta
  factory Oferta.fromJson(Map<String, dynamic> json) {
    return Oferta(
      idProducto: json['idProducto'],
      name: json['name'],
      domicilio: Ubicacion.fromJson(json['domicilio']),
      licencia: json['licencia'],
      precio: json['precio'] != null? Precio.fromJson(json['precio']) : null,
      vehiculo: json['vehiculo'],
      patente: json['patente'],
      modelo: json['modelo'],
      capacidadDeCarga: json['capacidadDeCarga'] != null ? CapacidadDeCarga.fromJson(json['capacidadDeCarga']) : null,
    );
  }

  // Método para convertir un objeto Oferta en un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'idProducto': idProducto,
      'name': name,
      'domicilio': domicilio!.toJson(),
      'licencia': licencia,
      'precio': precio!.toJson(),
      'vehiculo': vehiculo,
      'patente': patente,
      'modelo': modelo,
      'capacidadDeCarga': capacidadDeCarga!.toJson(),
    };
  }
}

class Ubicacion {
  final String? calle;
  final int? altura;
  final String? provincia;
  final String? ciudad;
  final String? referencia;

  Ubicacion({
    this.calle,
    this.altura,
    this.provincia,
    this.ciudad,
    this.referencia,
  });

  factory Ubicacion.fromJson(Map<String, dynamic> json) {
    return Ubicacion(
      calle: json['calle'],
      altura: json['altura'],
      provincia: json['Provincia'],
      ciudad: json['Ciudad'],
      referencia: json['referencia'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calle': calle,
      'altura': altura,
      'Provincia': provincia,
      'Ciudad': ciudad,
      'referencia': referencia,
    };
  }
}

class Precio {
  final String? moneda;
  final String? valor;

  Precio({
    this.moneda,
    this.valor,
  });

  factory Precio.fromJson(Map<String, dynamic> json) {
    return Precio(
      moneda: json['moneda'],
      valor: json['valor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'moneda': moneda,
      'valor': valor,
    };
  }
}

class CapacidadDeCarga {
  final double? peso;
  final String? unidadPeso;

  CapacidadDeCarga({
    this.peso,
    this.unidadPeso,
  });

  factory CapacidadDeCarga.fromJson(Map<String, dynamic> json) {
    return CapacidadDeCarga(
      peso: json['peso'].toDouble() ?? '',
      unidadPeso: json['unidadPeso'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'peso': peso,
      'unidadPeso': unidadPeso,
    };
  }
}
