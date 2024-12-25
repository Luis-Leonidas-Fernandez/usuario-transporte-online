import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usuario/blocs/blocs.dart';
import 'package:usuario/constants/constants.dart';



class AppBarConstants {
  AppBarConstants._();

  static PreferredSizeWidget customAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight), // Altura del AppBar
      child: BlocBuilder<NavigatorBloc, CustomNavigatorState>(
        builder: (context, navigatorState) {
          final index = navigatorState.selectedIndex;
          const nombre = 'Marco';
          final screenHeight = MediaQuery.of(context).size.height;

          if (index == 0) {
            return AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: const SizedBox.shrink(), // Espacio vacío en lugar del ícono "back"
              title: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.63, 0.0),
                      child: Text(
                        'Hola,',
                        style: GoogleFonts.lobsterTwo(
                          fontSize: screenHeight <= 640 ? 18 : 23,
                          fontWeight: FontWeight.w800,
                          color: AppConstants.secondColor,
                          shadows: const [
                            Shadow(
                              color: Color.fromRGBO(218, 145, 252, 0.843),
                              blurRadius: 20.0,
                            )
                          ],
                          letterSpacing: 1.7,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.56, 0.0),
                      child: Text(
                        nombre,
                        style: TextStyle(
                          fontSize: screenHeight <= 640 ? 18 : 20,
                          fontWeight: FontWeight.w700,
                          color: AppConstants.secondColor,
                          shadows: const [
                            Shadow(
                              color: Color.fromRGBO(218, 145, 252, 0.843),
                              blurRadius: 20.0,
                            )
                          ],
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // Acción para el botón de perfil
                  },
                  icon: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 27,
                      color: AppConstants.secondColor,
                    ),
                  ),
                ),
              ],
            );
          } else {
            // AppBar genérico para otros índices
            return AppBar(
              title: const Text(
                '',
                style: TextStyle(color: Colors.transparent),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            );
          }
        },
      ),
    );
  }
}