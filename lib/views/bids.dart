import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usuario/constants/constants.dart';
import 'package:usuario/models/binds.dart';


class BidsDetails extends StatelessWidget {

  final Oferta conductor;
  const BidsDetails({super.key, required this.conductor});

  @override
  Widget build(BuildContext context) {

   final width = MediaQuery.of(context).size.width; 
    return Column(
      children: [

        

        SizedBox(height: 35),

        Container(
          color: Color.fromARGB(34, 255, 255, 255),
          width: width * 0.9,
          height: 220,
          child: Column(children: [

            SizedBox(height: 18),
            
            Align(
              alignment: const Alignment(-0.72, 0.7),
              child: Text(
                'Información del Conductor',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

            SizedBox(height: 28),

             
            Align(
              alignment: const Alignment(-0.78, -0.7),
              child: Text(
                conductor.name ?? '',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

             SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.77, -0.7),
              child: Text(
                '${conductor.domicilio?.provincia ?? ''} ${conductor.domicilio?.ciudad ?? ''}',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),
             SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.77, -0.7),
              child: Text(
                '${conductor.domicilio?.calle?? ''} ${conductor.domicilio?.altura?? ''}',
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
                conductor.licencia ?? '',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

              SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.77, -0.7),
              child: Text(
                'Oferta: \$ ${conductor.precio?.valor ?? ''}',
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
          width: width * 0.9,
          height: 258,
          child: Column(children: [

            SizedBox(height: 22),
            
            Align(
              alignment: const Alignment(-0.8, -0.7),
              child: Text(
                'Detalle del transporte',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

            SizedBox(height: 35),

             
            Align(
              alignment: const Alignment(-0.77, -0.7),
              child: Text(
                conductor.vehiculo ?? '',
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
                'Patente: ${conductor.patente}',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

            SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.78, -0.7),
              child: Text(
                conductor.modelo ??'',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

            SizedBox(height: 5),

              Align(
              alignment: const Alignment(-0.50, -0.7),
              child: Text(
                'Capacidad de carga: ${conductor.capacidadDeCarga?.peso ?? ''}  ${conductor.capacidadDeCarga?.unidadPeso ?? ''}',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

            SizedBox(height: 18),

            Align(
              alignment: const Alignment(0.0, 0.0),
               child: SizedBox(
                 height: 35,
                 child: ElevatedButton(
                  onPressed: (){
                    //asignar conductor a order en DB
                    //screen exitoso
                    //enviar a home
                  },
                  child: Text('Elegir',style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
               )
             ),
              
            
          ]
          ),
        )
      ],
    );
  }
}
