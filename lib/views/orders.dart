import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usuario/constants/constants.dart';
import 'package:usuario/models/binds.dart';
import 'package:usuario/pages/auctions.dart';

class OrdersDetails extends StatelessWidget {

  final Productos producto;
  const OrdersDetails({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
  
    return GestureDetector(
      onTap: (){
        

        // Pasar el nombre al navegar
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Auctions(),
          ),
        );
      },
      child: Column(children: [
      
        SizedBox(height: 18),
        Container(
          color: Color.fromARGB(34, 255, 255, 255),
          width: width * 0.9,
          height: 250,
          child: Column(children: [
            SizedBox(height: 22),
            Align(
              alignment: const Alignment(-0.82, -0.7),
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
              alignment: const Alignment(-0.74, -0.7),
              child: Text(
                producto.tipoCarga,
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: const Alignment(-0.79, -0.7),
              child: Text(
                'Peso: ${producto.peso}',
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
                'Tamaño: ${producto.tamano}',
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
                'Estado: ${producto.estadoSubasta}',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),
            SizedBox(height: 12),
             Align(
                alignment: const Alignment(0.0, 0.0),
                 child: SizedBox(
                   height: 35,
                   child: ElevatedButton(
                    onPressed: (){
      
                      //aqui remover order de DB
                      //screen exitoso
                      //enviar a home page
                    },
                    child: Text('Cancelar',style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
                 )
               ),
          ]),
        ),
      
      
      ]),
    );
  }
}
