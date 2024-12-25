import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usuario/constants/constants.dart';
import 'package:usuario/models/binds.dart';
import 'package:usuario/service/bids_service.dart';
import 'package:usuario/views/orders.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
              backgroundColor: AppConstants.cardColor,
              elevation: 0,
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text('Ordenes',
                    style: GoogleFonts.roboto(
                        fontSize: 28,
                        color: AppConstants.textColor,
                        decoration: TextDecoration.none)),
              )),
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
                children: const [               
                 
                  OrdersContainers(),
                  
                ],
              ),
            )));
  }
}

class OrdersContainers extends StatefulWidget {
  const OrdersContainers({super.key});

  @override
  State<OrdersContainers> createState() => _OrdersContainersState();
}

class _OrdersContainersState extends State<OrdersContainers> {
       
  late Future<List<Productos>> _productosFuture;
  
  @override
  void initState() {
    super.initState();
    _productosFuture = _cargarProductos(); // Carga los datos al inicializar
  }
  

  Future<List<Productos>> _cargarProductos() async {
    try {
      // Cargar subastas
      final subastas = await cargarSubastas(); // Asume que cargarSubastas() devuelve List<Subasta>
     
      // Consolidar todos los productos en una sola lista
      final productos = subastas.expand((subasta) => subasta.productos).toList();
    
      return productos;
    } catch (e) {
      // Manejo de errores
      print("Error al cargar productos: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    

    return Container(          
      color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(height: 10),
          
          Expanded(
            child: FutureBuilder<List<Productos>>(
              future: _productosFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final productos = snapshot.data!;
                  return ListView.builder(
                    itemCount: productos.length,
                    itemBuilder: (context, index) {
                      final producto = productos[index];
                      return OrdersDetails(
                        producto: producto
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No hay productos disponibles."));
                }
              },
            ),
          ),
          SizedBox(height: 70),
        ],
      ) 
      
    );
  }
}