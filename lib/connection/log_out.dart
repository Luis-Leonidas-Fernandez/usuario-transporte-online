import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:usuario/service/addresses_service.dart';
import 'package:usuario/Generators/isolate_parse_json.dart';
import 'package:usuario/service/storage_service.dart';

class LogOutApp {


   LogOutApp._internal();


   static final LogOutApp _instance = LogOutApp._internal();
   static LogOutApp get instance => _instance;
   late AddressService addressService = AddressService(); 
      

   void finishApp() async {

    
    
    //Eliminar ID ORDER
    await StorageService.instance.deleteIdOrder();

    await StorageService.instance.deleteIdDriver();  
    
    // Eliminar token
    await StorageService.instance.deleteToken();

    //finalizar Isolate get Orders

    ParseData.instance.stopIsolate();    
    
     // Clear Hydrated Address Bloc
    HydratedBloc.storage.clear();

    
   }
}