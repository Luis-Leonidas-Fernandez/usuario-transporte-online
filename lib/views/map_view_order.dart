// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
//import 'package:usuario_inri/global/environment.dart';
import 'package:latlong2/latlong.dart';
import 'package:usuario_inri/blocs/blocs.dart';
import 'package:usuario_inri/models/usuario.dart';
import 'package:usuario_inri/service/auth_service.dart';


class MapViewOrder extends StatefulWidget {

final LatLng initialLocation;


const MapViewOrder({
Key? key,
required this.initialLocation,

}) : super(key: key);   

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
    Provider.of<AuthService>(context, listen:false);
    _mapController = MapController();
    
  }
@override
  void dispose() {
   
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {  
    
   final usuario       = Provider.of<AuthService>(context).usuario; 
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final myLocation   = locationBloc.state.lastKnownLocation!;
    
    final location = BlocProvider.of<AddressBloc>(context).state.orderUser!.mensaje;    
    final mapBloc  = BlocProvider.of<MapBloc>(context);  
    
    final zoom   = mapBloc.getZoom(location!);
    final center = mapBloc.bounds(location);       
    
    final userLocation = LatLng(location[0], location[1]);

    final size = MediaQuery.of(context).size; 

       return 
        SizedBox(
        width: size.width,
        height: size.height,
        child: FlutterMap(          
          mapController: _mapController,          
          options: MapOptions(             
            zoom: zoom,
            minZoom: 5.0,
            maxZoom: 20.0,            
            center:  center,
          ),
          nonRotatedChildren: [
            TileLayer(
              urlTemplate: usuario.urlMapbox,
              additionalOptions: {               
                'accessToken': usuario.tokenMapBox,
                'id': usuario.idMapBox,
              },
              
            ),
            
              MarkerLayer(
              markers: [
                Marker(                  
                  point: LatLng(myLocation.latitude, myLocation.longitude),
                  width: 90,
                  height: 90,
                  builder: (context) => 
                 Container(                                                   
                  color: Colors.transparent,
                  child: Image.asset('assets/icon.jpg'),                  
                 ) 
                ),
                  
              ],            
            ),
            MarkerLayer(
              markers: [
                Marker(                  
                  point: LatLng(  userLocation.latitude, userLocation.longitude,) ,
                  width: 110,
                  height: 110,
                  builder: (context) => 
                 Container(                                                   
                  color: Colors.transparent,
                  child: Image.asset('assets/driver.png'),                  
                 ) 
                ),
                  
              ],            
            ),  
          ],          
        ),
       );
       
     
  }
}
