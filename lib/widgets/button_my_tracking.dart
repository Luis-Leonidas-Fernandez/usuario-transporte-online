import 'package:flutter/material.dart';


class BtnMyTracking extends StatelessWidget { 
  

  const BtnMyTracking({
  super.key,   
  });

  @override
  Widget build(BuildContext context) { 
    

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      
      
        children:  <Widget>[
    
          FloatingActionButton(
            backgroundColor: Colors.indigo,
            child: const Icon(Icons.gps_fixed),
            onPressed: () {

                 
              
              }   
                      
          ),          
          const SizedBox(
            height: 90)
        ] 
    );
  }
}


