
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usuario/blocs/blocs.dart';
import 'package:usuario/constants/constants.dart';
//import 'package:usuario/models/address.dart';
import 'package:usuario/responsive/responsive_ui.dart';
import 'package:usuario/service/addresses_service.dart';
import 'package:usuario/service/message_service.dart';
import 'package:usuario/service/storage_service.dart';

import 'package:usuario/widgets/btn_reusable.dart';
import 'package:usuario/widgets/container_detail.dart';
import 'package:usuario/widgets/custom_message_error.dart';
import 'package:usuario/widgets/custom_message_success.dart';

import 'package:usuario/widgets/presentation_container.dart';
import 'package:usuario/widgets/widgets.dart';

class BookingCard extends StatefulWidget {




  const BookingCard({
    super.key,
   
  });

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {

  final MessageService messageService = MessageService();
  

  @override
  Widget build(BuildContext context) {


    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    ResponsiveUtil responsiveUtil = ResponsiveUtil(context);
    double responsiveTop = responsiveUtil.getResponsiveHeight(0.50);

    late AddressService addressService = AddressService();
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final addressBloc = BlocProvider.of<AddressBloc>(context);
    final locationBloc = BlocProvider.of<LocationBloc>(context);
  
    final isAccepted = addressBloc.state.isAccepted!;  
   

    return Positioned(
      top: responsiveTop,
      left: 0,
      right: 0,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 550),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/background_image.png'),
                fit: BoxFit.cover,
                opacity: 0.8),
            gradient: AppConstants.backgroundCard,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 192, 191, 191),
                  blurRadius: 25,
                  spreadRadius: 1.0,
                  offset: Offset(5, 0)),
            ]),
        child: Stack(children: [
          Positioned(
            top: 290,
            left: 0.0,
            right: 0.0,
            child: Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppConstants.cardColor.withAlpha(2),
                AppConstants.cardColor,
                AppConstants.cardColor,
              ], begin: Alignment.topCenter, end: Alignment.center)),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detalle Viaje',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: screenWidth <= 370 ? 55 : 90),
                const Row(children: [
                  Icon(
                    Icons.discount_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Cupon',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '\$ 250',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
              ],
            ),
          ),

          


          Positioned(
              top: 115,
              left: 20,
              right: 20,
              child: Container(
                  color: Colors.transparent,
                  child: BlocBuilder<AddressBloc, AddressState>(
                    builder: (context, stateAddress) {

                      final existDriver = stateAddress.orderUser?.ok ?? false;
                      // ignore: avoid_print
                      print("exist driver: $existDriver");

                      if( existDriver == true) {

                        // ignore: avoid_print
                        print("Exist Driver Container detail: $existDriver");
                        return ContainerDetail();
                      } else if(stateAddress.isAccepted == true && existDriver == false){
                        // ignore: avoid_print
                        print("Exist Driver : Time Line Address: $existDriver");
                        return TimeLineAddress();
                      }
                      return PresentationContainer();
                    } 

                    )
                

                  )),
          
          isAccepted == false ?
          Positioned(
              top: screenHeight * 0.35,
              left: 20,
              right: 20,
              child: ButtonReusable(
                  text: 'Pedir Ahora',
                  onPressed: () async {
                    // ignore: avoid_print
                    print("button pedir tap");

                    //extrae token y idUser del State
                    final String? token = authBloc.state.usuario?.token;
                    final String? idUser = authBloc.state.usuario?.uid;

                    //Se reservo un conductor
                    final myLocation = locationBloc.state.lastKnownLocation!;
                    final idOrder = await addressService.postAddresses(
                        myLocation, token!, idUser!);

                    //activa y muestra mensajes con el estatus de la address

                    messageService.initPeriodicMessage();

                    if (!context.mounted) return;

                    if (idOrder == null) {

                      //Mostramos mensaje de error
                     
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: CustomSnackBarContentError(),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          duration: Duration(seconds: 5),
                        ),
                      );
                    } else {

                      //Mostramos mensaje de exito
                     
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: CustomSnackBarContentSuccess(),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          duration: Duration(seconds: 5),
                        ),
                      );

                      // eventos que manejan la visibilidad de botones
                      //IS ACCEPTED= TRUE
                      addressBloc.add(OnIsAcceptedTravel());
                    }
                  }
                )
              )
              : Positioned(
              top: screenHeight * 0.35,
              left: 20,
              right: 20,
              child: ButtonReusable(
                  text: 'Finalizar',
                  onPressed: () async {

                    // ignore: avoid_print
                                   

                    //extrae token y idUser del State
                  final String? token = authBloc.state.usuario?.token; 
                  final String? idUser = authBloc.state.usuario?.uid;  

                  // Eliminando viaje de base de datos
                  await  addressService.finishTravel(token!, idUser!); 

                  await StorageService.instance.deleteIdDriver();
                  await StorageService.instance.deleteIdOrder();

                  //desactiva mensajes de la address
                  messageService.cancelPeriodicMessage();                     
                  
                  // Clear Hydrated storage
                                    
                  //Limpiando el State
                  // EXIST ORDER = FALSE -- IS ACCEPTED = FALSE 
                  addressBloc.add(const OnClearStateEvent());

                  if(!context.mounted) return; 
                 
                  Navigator.pushReplacementNamed(context, 'notification');
                  }
                )
              ),

              
              Positioned(
                top: 20,
                child: OverflowBar())  ,


        ]
       ),
      ),
    );
  }
}
