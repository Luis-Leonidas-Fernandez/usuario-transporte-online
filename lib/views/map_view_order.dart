import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:usuario/blocs/blocs.dart';
import 'package:usuario/models/usuario.dart';
import 'package:usuario/service/auth_service.dart';


class MapViewOrder extends StatefulWidget {

final LatLng initialLocation;


const MapViewOrder({
super.key,
required this.initialLocation,

});   

  @override
  State<MapViewOrder> createState() => _MapViewOrderState();
}

class _MapViewOrderState extends State<MapViewOrder> {

  late LocationBloc locationBloc;
  late AddressBloc addressBloc;
  late final MapController _mapController;
  late Usuario usuario;
  AuthService? authService;


  @override
  void initState() {    
    super.initState();

    BlocProvider.of<AddressBloc>(context);
    BlocProvider.of<AuthBloc>(context, listen:false);
    _mapController = MapController();
    
  }
@override
  void dispose() {
   
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) { 

    String urlMapBox = dotenv.get('MAPBOX_URL');
    String tokenMapBox = dotenv.get('TOKEN_MAP_BOX');
    String idMapBox = dotenv.get('ID_MAPBOX');   
   
   
    
    final  usuario      = Provider.of<AuthBloc>(context).state.usuario;

    if(usuario == null) return Container(); 

    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final myLocation   = locationBloc.state.lastKnownLocation!;
    final mapBloc  = BlocProvider.of<MapBloc>(context); 
    final loc = BlocProvider.of<AddressBloc>(context).state.orderUser?.mensaje?.coordinates;


    final location =  loc ?? [];   

    final zoom   = mapBloc.getZoom(location);    
    final center = mapBloc.bounds(location); 
    
    final size = MediaQuery.of(context).size; 

       return 
        SizedBox(
        width: size.width,
        height: size.height,
        child: FlutterMap(          
          mapController: _mapController,          
          options: MapOptions( 
            initialCenter: center,            
            initialZoom: zoom,
            minZoom: 1.0,
            maxZoom: 20.0,            
            
          ),
          children: [

            TileLayer(
              urlTemplate: urlMapBox,
              //usuario.urlMapbox,
              additionalOptions: {               
                'accessToken': tokenMapBox, 
                //usuario.tokenMapBox,
                'id': idMapBox
                //usuario.idMapBox,
              },
              
            ),
            
              MarkerLayer(

              markers: [

                Marker(                  
                  point: LatLng(myLocation.latitude, myLocation.longitude),
                  width: 70,
                  height: 70,
                  child:  
                 Container(                                                   
                  color: Colors.transparent,
                  child: Image.asset('assets/icon.png'),                  
                 ) 
                ),
                
               if (location.isNotEmpty)               
                Marker(                  
                  point: LatLng(location[1], location[0]),
                  width: 110,
                  height: 110,
                  child:  
                 Container(                                                   
                  color: Colors.transparent,
                  child: Image.asset('assets/driver.png'),                  
                 ) 
                )              
                  
              ],            
            ),
            
          ],          
        ),
       );
            
  }
}
