import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:latlong2/latlong.dart';
import 'package:usuario/blocs/blocs.dart';

import 'package:usuario/constants/app_bar.dart';

import 'package:usuario/models/address.dart';
import 'package:usuario/models/usuario.dart';

import 'package:usuario/pages/info_profile.dart';
import 'package:usuario/pages/order_page.dart';


import 'package:usuario/views/map_view_order.dart';
import 'package:usuario/widgets/big_booking_card.dart';

import 'package:usuario/widgets/small_booking_card.dart';
import 'package:usuario/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MapBloc? mapBloc;
  AddressBloc? addressBloc;
  LocationBloc? locationBloc;
  AuthBloc? usuarioBloc;
  Usuario? usuario;
  Timer? _timer; // Timer para controlar el retraso
  LatLng? location;
  // Páginas a navegar
  final List<Widget> _pages = [
    MapViewOrder(),
    OrderPage(),
    //Auctions(),
    InfoProfile(),
  ];

  @override
  void initState() {
    super.initState();

    final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
    final addressBloc = BlocProvider.of<AddressBloc>(context);
    addressBloc.state.loading;
    addressBloc.startLoadingAddress();
    BlocProvider.of<AuthBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    // Iniciar el temporizador para mostrar las tarjetas después de 5 segundos
    _timer = Timer(const Duration(seconds: 5), () {
      mapBloc.add(OnCardReadyEvent());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    locationBloc?.stopFollowingUser();
    addressBloc?.stopLoadingAddress();
    usuarioBloc?.deleteUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addressBloc = BlocProvider.of<AddressBloc>(context);
    //final usuarioBloc =  BlocProvider.of<AuthBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    

    //final usuario = usuarioBloc.state.usuario;
    addressBloc.state.loading;


    final index = BlocProvider.of<NavigatorBloc>(context).state.selectedIndex;
    final height = MediaQuery.of(context).size.height;
    
    
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarConstants.customAppBar(context),
      body: BlocBuilder<LocationBloc, LocationState>(builder: (context, state) {
        //if(state.lastKnownLocation == null || usuario == null)  return CircularProgress();
        //final point = LatLng(-27.456423, -58.979525);
        //final long = point.longitude;
        //(state.lastKnownLocation!.longitude);
        //final lat = point.latitude;
        //state.lastKnownLocation!.latitude;

        return StreamBuilder(
            stream: addressBloc.getOrderUser(),
            builder: (context, AsyncSnapshot<OrderUser> snapshot) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    

                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: BlocBuilder<NavigatorBloc, CustomNavigatorState>(
                          builder: (context, state) {
                        return IndexedStack(
                          index: state.selectedIndex,
                          children: _pages,
                        );
                      }),
                    ),

                    
                     if (
                      mapBloc.state.isCardReady == true &&                     
                      height > 778
                       &&
                      mapBloc.state.isMapInitialized == true
                      ) 

                      BlocBuilder<NavigatorBloc, CustomNavigatorState>(
                        builder: (context, navigatorState) {
                        if (navigatorState.selectedIndex == 0){
                          return BigBookingCard();
                        }else{
                          return Container();
                        }                       
                          
                        }
                        ),
                     


                      if (
                      mapBloc.state.isCardReady == true &&
                      index == 0 && 
                      height < 778 &&
                      mapBloc.state.isMapInitialized == true
                      ) 

                      BlocBuilder<NavigatorBloc, CustomNavigatorState>(
                        builder: (context, navigatorState) {
                        if (navigatorState.selectedIndex == 0){
                          return SmallBookingCard();
                        }else{
                          return Container();
                        }                       
                          
                        }
                        ),


                      

                    if (mapBloc.state.isCardReady ==true && index == 0) // Barra de botones transparente
                      Positioned(
                        bottom: 4.0,
                        left: 20.0,
                        right: 20.0,
                        child: CustomButtonBar()
                      ),
                  ],
                ),
              );
            });
      }),
    );
  }
}


