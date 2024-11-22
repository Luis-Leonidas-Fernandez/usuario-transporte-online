import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:latlong2/latlong.dart';
import 'package:usuario/blocs/blocs.dart';
import 'package:usuario/constants/app_bar.dart';


import 'package:usuario/models/address.dart';
import 'package:usuario/models/usuario.dart';

import 'package:usuario/views/circular_progress_view.dart';
import 'package:usuario/views/map_view_order.dart';
import 'package:usuario/widgets/booking_card.dart';
import 'package:usuario/widgets/car.dart';
import 'package:usuario/widgets/small_booking_card.dart';


class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  AddressBloc? addressBloc;
  LocationBloc? locationBloc;
  AuthBloc? usuarioBloc;
  Usuario? usuario;
 
  
  @override
  void initState() {
    super.initState();
    
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
    final addressBloc =  BlocProvider.of<AddressBloc>(context);
    addressBloc.state.loading;    
    addressBloc.startLoadingAddress();
    BlocProvider.of<AuthBloc>(context);
          
    
  }

  @override
  void dispose() {   
    locationBloc?.stopFollowingUser();
    addressBloc?.stopLoadingAddress();
    usuarioBloc?.deleteUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final addressBloc =  BlocProvider.of<AddressBloc>(context);
    final usuarioBloc = BlocProvider.of<AuthBloc>(context);

  
    final usuario = usuarioBloc.state.usuario;
    addressBloc.state.loading;
    final height = MediaQuery.of(context).size.height;

 
    
    return Scaffold(
      extendBodyBehindAppBar: true, 
      appBar: AppBarConstants.customAppBar(context),     
    
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {

          
          if(state.lastKnownLocation == null || usuario == null)  return CircularProgress();
                
          final long = (state.lastKnownLocation!.longitude);
          final lat  = state.lastKnownLocation!.latitude;          
         
                              
              return StreamBuilder(
              stream: addressBloc.getOrderUser(),
              builder: (context, AsyncSnapshot<OrderUser> snapshot) {

                return SingleChildScrollView(
                 
                  child: Stack(              
                    
                    children: [
              
                      usuarioBloc.state.usuario != null ?
                      
                      MapViewOrder(initialLocation: LatLng( lat, long))// IS ACCEPTED = TRUE
                      : Container(),     
                                            
                       height < 778 ?
                      const SmallBookingCard()
                      : BookingCard() ,

                      const CarImage()    
              
                 ],
                ), 
             );
           }
          );
         }
        ),      
        
     
      );
     }
    }
   
   
    
   
  
