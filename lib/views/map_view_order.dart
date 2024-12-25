import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
//import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:usuario/blocs/blocs.dart';
/* import 'package:usuario/models/usuario.dart';
import 'package:usuario/service/auth_service.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';   */ // Para acceder a variables de entorno

class MapViewOrder extends StatefulWidget {
  //final LatLng initialLocation;

  const MapViewOrder({
    super.key,
    //required this.initialLocation,
  });

  @override
  State<MapViewOrder> createState() => _MapViewOrderState();
}

class _MapViewOrderState extends State<MapViewOrder> {
  late final MapController _mapController;
  late LocationBloc locationBloc;
  
  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    BlocProvider.of<LocationBloc>(context);

    // Emitir el evento al inicializar el widget
    Future.microtask(() {
      BlocProvider.of<MapBloc>(context).add(OnMapReadyEvent());
    });

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final location= LatLng(-27.456423, -58.979525);
    //BlocProvider.of<LocationBloc>(context);
    //final zomm = [-58.973495, -27.452577 ];
    String urlMapBox = dotenv.get('MAPBOX_URL');
    String tokenMapBox = dotenv.get('TOKEN_MAP_BOX');
    String idMapBox = dotenv.get('ID_MAPBOX');

    //print("url : $urlMapBox   token:  $tokenMapBox  idMap: $idMapBox");

    if (urlMapBox.isEmpty || tokenMapBox.isEmpty || idMapBox.isEmpty) {
      return Center(
        child: Text('Configuración de MapBox inválida'),
      );
    }

    // Obtener el usuario desde el AuthBloc
    //final usuario = Provider.of<AuthBloc>(context).state.usuario;
    //if (usuario == null) return Container();

    // Obtener la ubicación actual desde LocationBloc
    //final locationBloc = BlocProvider.of<LocationBloc>(context);
    //final myLocation = locationBloc.state.lastKnownLocation!;

    // Obtener las coordenadas del usuario desde AddressBloc
    //final loc = BlocProvider.of<AddressBloc>(context).state.orderUser?.mensaje?.coordinates;
    //final location = loc ?? [];

    // Obtener el estado del zoom y los límites del mapa desde MapBloc
    //final mapBloc = BlocProvider.of<MapBloc>(context);

    //final zoom = mapBloc.getZoom(zomm); //cambiar a location
    //final center = mapBloc.bounds(zomm);

    final size = MediaQuery.of(context).size;

    //final mapBloc = BlocProvider.of<MapBloc>(context);

    /* final boundsDriver = LatLngBounds.fromPoints([
     widget.initialLocation,
     const LatLng(-46.437344, -69.156298),
     
     ]);

     final boundsMap = LatLngBounds.fromPoints([
     const LatLng(-46.437344, -69.156298),
     const LatLng(-3.402683, -59.381535

),
     
     ]); */

     /* final LatLng  center = LatLng(
      (boundsMap.southWest.latitude + boundsMap.northEast.latitude)/2,
      (boundsMap.southWest.longitude + boundsMap.northEast.longitude)/2, 
      );  */
     //print("Center map: $center");
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        if (state.isMapInitialized) {
          return Stack(children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: LatLng(-51.475480, -62.772104
    
    ),
                  initialZoom: 4.0,
                  minZoom: 2.0,
                  maxZoom: 12.0,
                  
                ),
                children: [
                  TileLayer(
                    urlTemplate: urlMapBox,
                    additionalOptions: {
                      'accessToken': tokenMapBox,
                      'id': idMapBox,
                    },
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: location,
                        width: 70,
                        height: 70,
                        child: Container(
                          color: Colors.transparent,
                          child: Image.asset('assets/icon_truck.png'),
                        ),
                      ),
                    ],
                  ),
                   MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(-46.437344, -69.156298),
                        width: 70,
                        height: 70,
                        child: Container(
                          color: Colors.transparent,
                          child: Image.asset('assets/icon.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                top: 350,
                right: 20,
                child: FloatingActionButton(
                    onPressed: () {
                      _mapController.move(location, 8);
                    },
                     child: Icon(Icons.gps_fixed))),
            Positioned(
                top: 410,
                right: 20,
                child: FloatingActionButton(
                    onPressed: () {
                      //final camera = MapCamera.of(context);
                      final zoom = max(_mapController.camera.zoom - 2, 1.0);                          
                      _mapController.move(location, zoom);
                    },
                     child: Icon(Icons.zoom_out)))         
          ]);
        } else {
          // Mientras el mapa no está listo, muestra un indicador de progreso
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
