import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usuario/constants/constants.dart';

class CardShippingDetails extends StatelessWidget {
  const CardShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [



        Container(
          color: Color.fromARGB(34, 255, 255, 255),
          width: 370,
          height: 200,
           child: Column(children: [

            SizedBox(height: 22),
            
            Align(
              alignment: const Alignment(-0.8, -0.7),
              child: Text(
                'Paquete a enviar',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

            SizedBox(height: 35),

             
            Align(
              alignment: const Alignment(-0.7, -0.7),
              child: Text(
                'Tipo: Carga refrigerada',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

             SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.75, -0.7),
              child: Text(
                'Peso: 1000 kg',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

            SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.72, -0.7),
              child: Text(
                'Tamaño: 15x50x12',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),




          ]),
        ),


        SizedBox(height: 35),

        Container(
          color: Color.fromARGB(34, 255, 255, 255),
          width: 370,
          height: 200,
          child: Column(children: [

            SizedBox(height: 22),
            
            Align(
              alignment: const Alignment(-0.7, -0.7),
              child: Text(
                'Información de la entrega',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

            SizedBox(height: 35),

             
            Align(
              alignment: const Alignment(-0.76, -0.7),
              child: Text(
                'monteagudo 834',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

             SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.75, -0.7),
              child: Text(
                'Resistencia Chaco',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

            SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.67, -0.7),
              child: Text(
                'Recibe Margarina Robledo',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),




          ]),
        ),

        SizedBox(height: 10),
        Container(
          color: Color.fromARGB(34, 255, 255, 255),
          width: 370,
          height: 200,
          child: Column(children: [

            SizedBox(height: 22),
            
            Align(
              alignment: const Alignment(-0.8, -0.7),
              child: Text(
                'Detalle del pago',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

            SizedBox(height: 35),

             
            Align(
              alignment: const Alignment(-0.70, -0.7),
              child: Text(
                'Dinero con Master Card',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

             SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.70, -0.7),
              child: Text(
                'Fecha: 3 de noviembre',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

            SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.76, -0.7),
              child: Text(
                'Pago aprobado',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),




          ]),
        ),

         SizedBox(height: 10),
        Container(
          color: Color.fromARGB(34, 255, 255, 255),
          width: 370,
          height: 200,
          child: Column(children: [

            SizedBox(height: 22),
            
            Align(
              alignment: const Alignment(-0.8, -0.7),
              child: Text(
                'Informacion del transportista',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

            SizedBox(height: 35),

             
            Align(
              alignment: const Alignment(-0.70, -0.7),
              child: Text(
                'Pablo E. Robledo',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

             SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.70, -0.7),
              child: Text(
                'Oferta: \$ 850.000',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

            SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.72, -0.7),
              child: Text(
                'Mercedes Benz',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),
            SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.69, -0.7),
              child: Text(
                'Patente: FG842LM',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),
            
           



          ]),
        )
      ],
    );
  }
}
