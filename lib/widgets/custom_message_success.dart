import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usuario/blocs/blocs.dart';

class CustomSnackBarContentSuccess extends StatelessWidget {
  const CustomSnackBarContentSuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(248, 54, 160, 111),
               borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(children: const [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Felicitaciones!',
                        style: TextStyle(fontSize: 19, color: Colors.white)),
                    Spacer(),
                    Text(
                      "Tu viaje fue reservado con exito solo queda esperar",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ]);
      },
    );
  }
}