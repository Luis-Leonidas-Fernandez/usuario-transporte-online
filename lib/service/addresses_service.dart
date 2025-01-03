import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:usuario/Generators/isolate_parse_json.dart';
import 'package:usuario/global/environment.dart';
import 'package:usuario/models/address.dart';
import 'package:usuario/models/location.dart';
import 'package:usuario/models/usuario.dart';
import 'package:usuario/service/auth_service.dart';
import 'package:usuario/service/storage_service.dart';


class AddressService {   
  
  late AuthService authService;
  //Address? address;
  Usuario? usuario;
  final storage = StorageService.instance;


  Future getAddressesBackground() async {

    final token = await storage.getToken();
    final idUser = await storage.getId();

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
      'x-token': token.toString()
    };

    final resp = await http.get(
        Uri.parse('${Environment.apiUrl}/viajes/$idUser'),
        headers: headers);

    if (resp.statusCode == 200) {
      
      final data = resp.body;      
    
     await storage.deleteIdOrder();  
      

      final respuesta = await ParseData.instance.isolateFunction(data);
     

      final idOrder = respuesta.id;
      
      await storage.saveIdOrder(idOrder);

      return respuesta;
    }

    if (resp.statusCode == 201) {

      //convert data a Address Model
      await storage.deleteIdOrder();
      final date = OrderUser(id: null);
      final result = date;

      return result;
    }

    if (resp.statusCode == 401) {

      await storage.deleteIdOrder();

      final date = OrderUser(id: null);
      final result = date;
      return result;
    } else {
      return throw Exception('oops!');
    }
  }



  Future<OrderUser> getAddress(String token, String idUser ) async {        
   
  
  final newMap = {'id': null};
 
  final Map<String, String> headers = {'Content-Type': 'application/json', 'Charset': 'utf-8','x-token': token.toString()};
  
  final resp = await http.get(Uri.parse('${Environment.apiUrl }/viajes/$idUser'), headers: headers); 
  
    
  try {
    
    if ( resp.statusCode == 200) {    
  
  //data decoded
  final dataMap = jsonDecode(resp.body)["address"];
  
  //convert data a Address Model
  final Map<String, dynamic> response = dataMap ?? newMap;
  
  final data = OrderUser.fromJson(response);
  
  
  await storage.saveIdOrder(data.id);  
     
  return data;  
  
} if(resp.statusCode == 201){

  //convert data a Address Model
  final date = jsonDecode(resp.body)["emptyObject"];
  final result = OrderUser.fromJson(date);
  
  await storage.deleteIdOrder();

  return result;

} else{
   
  return OrderUser(id: null);
  
} 
  } on FormatException catch (e) {  
    // ignore: avoid_print
    print("error : $e");   
        
      return throw Exception(e);
  } catch (e) {
    // Handle all other errors
    // ignore: avoid_print
    print('Error: $e');
    throw Exception('Error: $e');
  }
  
}

   
  Future postAddresses( LatLng ubicacion, String token, String idUser) async {  
      
   
  final lat   = ubicacion.latitude;
  final long  = ubicacion.longitude;
  final  position = [long, lat ];
  
  final data = {'miId': idUser, 'estado': true, 'ubicacion': position};  
  final Map<String, String> headers = {'Content-Type': 'application/json', 'Charset': 'utf-8','x-token': token.toString()};
  final body = jsonEncode(data); 
    

  final resp = await http.post(Uri.parse('${Environment.apiUrl }/ubicaciones/lugar'), body: body, headers: headers);
 
  if ( resp.statusCode == 200) {

  //data decoded
  final dataMap = jsonDecode(resp.body)["data"];

  final response           = Location.fromMap(dataMap);
  final order          = response.id;  
  

  await storage.saveIdOrder(order);     
  
 
   return order;
  
  
} else if(resp.statusCode == 201) {
  
  const idOrderNull = null;
  return idOrderNull;
}       
}




 Future<dynamic> finishTravel(String token, String idUser) async {    
  

  final Map<String, String> headers = {'Content-Type': 'application/json', 'Charset': 'utf-8','x-token': token.toString()};
  final Map<String, String> data   = {'miId': idUser, 'order': 'libre'};

  
  final resp = await http.put(Uri.parse('${Environment.apiUrl }/ubicaciones/remove/address'), headers: headers, body: json.encode(data));
  if ( resp.statusCode == 200 ) {

  final Map<String, dynamic> address = jsonDecode(resp.body);
  

  return address;    
} else {
  return '';
}
}


Future<bool> isActiveOrder() async {
    final isActive = await StorageService.instance.getIdOrder();
    
    if(isActive == null ){
    return false;
    }
    return true;
  }
 
}
