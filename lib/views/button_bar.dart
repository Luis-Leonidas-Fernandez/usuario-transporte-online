import 'package:flutter/material.dart';

class ButtonBar extends StatelessWidget {
  const ButtonBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
         
          // ButtonBar transparente y persistente
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withValues(), // Transparencia del fondo
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    child: const Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'home');
                    },
                    child: const Text('Home'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'info');
                    },
                    child: const Text('Info'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'order');
                    },
                    child: const Text('Order'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'auctions');
                    },
                    child: const Text('Auctions'),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    
  }
}


