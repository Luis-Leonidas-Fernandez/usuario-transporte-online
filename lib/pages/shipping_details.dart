import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usuario/constants/constants.dart';
import 'package:usuario/responsive/responsive_ui.dart';
import 'package:usuario/views/card_shipping_datails.dart';



class ShippingDetails extends StatefulWidget {
  const ShippingDetails({super.key});

  @override
  State<ShippingDetails> createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  @override
  Widget build(BuildContext context) {

     final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
            backgroundColor: AppConstants.cardColor,
            elevation: 0,
            title: Center(
              child: Text('Detalle del Envio',
                  style: GoogleFonts.roboto(
                      fontSize: 28,
                      color: AppConstants.textColor,
                      decoration: TextDecoration.none)),
            )),
      body: SingleChildScrollView(
          child: Container(
              constraints: const BoxConstraints(maxHeight: 950),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/background_image.png'),
                      fit: BoxFit.cover,
                      opacity: 0.9),
                  gradient: AppConstants.backgroundCard
                  ),
              child: Stack(
          
                children: [
          
                  Positioned(
                    top: height * 0.6,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      width: double.infinity,
                      height: 900,                 
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        AppConstants.cardColor.withAlpha(2),
                        AppConstants.cardColor,
                      ], begin: Alignment.topCenter, end: Alignment.center)
                      ), 
                      ),
                  ),
          
                  Positioned(
                    top: height * 0.014,
                    left: 05.0,
                    right: 05.0,
                    child: ShippingContainers()
                  ),

                  
               ],
              )
           
         ),
        ),
    );
    
  
  }
}
  
class ShippingContainers extends StatefulWidget {
  
  const ShippingContainers({super.key});

  @override
  State<ShippingContainers> createState() => _ShippindContainersState();
}

class _ShippindContainersState extends State<ShippingContainers> {

  @override
  Widget build(BuildContext context) {
  
  ResponsiveUtil responsiveUtil = ResponsiveUtil(context);
  double responsiveHeight = responsiveUtil.getResponsiveHeight(0.015);
  

  return SingleChildScrollView(
    child: Container(      
      color: Colors.transparent,
      child: Column(
  children: [
  

    SizedBox(height: responsiveHeight),
    
    const CardShippingDetails(),  
    
    
  ],
      ),
    ),
  );
}

}