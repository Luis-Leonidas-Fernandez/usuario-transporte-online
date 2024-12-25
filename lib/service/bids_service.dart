import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:usuario/models/binds.dart'; 


Future<List<Subasta>> cargarSubastas() async {
  try {
    // Leer el archivo JSON desde los assets
    String jsonString = await rootBundle.loadString('assets/data.json');

    // Decodificar la lista JSON
    final jsonData = jsonDecode(jsonString);  
    
    // Validar que sea una lista
    if (jsonData is List) {
      // Convertir cada elemento en un objeto Subasta
      return jsonData.map((json) => Subasta.fromJson(json)).toList();      
      
     
    } else {
      throw FormatException("El JSON no es una lista.");
    }
  } catch (e) {
    // Manejo de errores
    // ignore: avoid_print
    print("Error al cargar subastas: $e");
    return []; // Devuelve una lista vacía en caso de error
  }
}
