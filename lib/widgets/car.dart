import 'package:flutter/material.dart';

class CarImage extends StatelessWidget {

  const CarImage({super.key});

  @override
  Widget build(BuildContext context) {
   
    final screenHeight = MediaQuery.of(context).size.height;  

    return Positioned(
      top: screenHeight * 0.38,
      left: 35,
      right: 35,
      child: Container(        
        width: 320,
        height: 200,         
        decoration: const BoxDecoration(                
            image: DecorationImage(
                image: AssetImage('assets/truck_b.png'),                
              ),
              
              ),
      ),
    );
  }
}
