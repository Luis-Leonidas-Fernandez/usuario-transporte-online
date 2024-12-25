import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usuario/constants/constants.dart';
import 'package:usuario/models/binds.dart';
import 'package:usuario/service/bids_service.dart';
import 'package:usuario/views/bids.dart';



class Auctions extends StatefulWidget {

  final String? idProducto;
  const Auctions({super.key, this.idProducto});

  @override
  State<Auctions> createState() => _AuctionsState();
}

class _AuctionsState extends State<Auctions> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppConstants.cardColor,
            elevation: 0,
            leading: IconButton(
            icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
            title: Center(
              child: Text('Subastas',
                  style: GoogleFonts.roboto(
                      fontSize: 28,
                      color: AppConstants.textColor,
                      decoration: TextDecoration.none)),
            ),
           ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/background_image.png'),
                    fit: BoxFit.cover,
                    opacity: 0.9),
                gradient: AppConstants.backgroundCard),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppConstants.cardColor.withAlpha(2),
                AppConstants.cardColor,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Stack(
                children: [               
                 
                  ShippingContainers(idProducto: widget.idProducto),
                  
                ],
              ),
            )));
  }
}

class ShippingContainers extends StatefulWidget {
  
  final String? idProducto;
  const ShippingContainers({super.key, this.idProducto });

  @override
  State<ShippingContainers> createState() => _ShippingContainersState();
}

class _ShippingContainersState extends State<ShippingContainers> {

  late Future<List<Oferta>> _ofertasFuture;

  @override
  void initState() {
    super.initState();
    _ofertasFuture = _cargarOfertas(); // Carga los datos al inicializar
  }
  

  Future<List<Oferta>> _cargarOfertas() async {

    if (widget.idProducto == null || widget.idProducto!.isEmpty) {
    return []; // Retorna una lista vacía si idProducto no está definido.
    }

    // Cargar subastas
    final subastas = await cargarSubastas();    
    // Consolidar todas las ofertas en una sola lista
    final ofertas = subastas
    .expand((subasta) => subasta.ofertas)
    .where((oferta) => oferta.idProducto == widget.idProducto)
    .toList();   
    return ofertas;
  }

  @override
  Widget build(BuildContext context) {

     
     final width = MediaQuery.of(context).size.width; 
     

    return Container(          
      color: Colors.transparent,
      child: Column(
        children: [
       

          SizedBox(height: 32),

        Container(
          color: Color.fromARGB(34, 255, 255, 255),
          width: width * 0.9,
          height: 80,
           child: Column(children: [

            SizedBox(height: 22),
            
            Align(
              alignment: const Alignment(-0.0, -0.0),
              child: Text(
                'Ofertas recibidas',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: AppConstants.textColor,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.4),
              ),
            ),

                 



          ]),
        ),

        SizedBox(          
          width: width * 0.9,
          height: 20,
        ),

           
          Expanded(
            child: FutureBuilder<List<Oferta>>(
              future: _ofertasFuture,
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(),);

                } else if(snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if(snapshot.hasData) {
                  final conductores = snapshot.data!;
                  return ListView.builder(
                    itemCount: conductores.length,
                    itemBuilder: (context, index) {
                      final conductor = conductores[index];
                      return BidsDetails(
                        conductor: conductor
                      );
                    }
                  );
                } else {
                  return Container();
                }
              }
            )
          ),
          SizedBox(height: 12),
        ],
      ) 
      
    );
  }
}
