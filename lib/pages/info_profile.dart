import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:usuario/constants/constants.dart';
import 'package:usuario/providers/login_form_validar.dart';
import 'package:usuario/responsive/responsive_ui.dart';
import 'package:usuario/widgets/imputs_form_registration.dart';

class InfoProfile extends StatefulWidget {
  const InfoProfile({super.key});

  @override
  State<InfoProfile> createState() => _InfoProfileState();
}

class _InfoProfileState extends State<InfoProfile> {
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            constraints: const BoxConstraints(maxHeight: 950),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/background_image.png'),
                    fit: BoxFit.cover,
                    opacity: 0.9),
                gradient: AppConstants.backgroundCard
                ),
            child: Stack(
        
              children: [
        
                Positioned(
                  top: height * 0.6,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    width: double.infinity,
                    height: 600,                 
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      AppConstants.cardColor.withAlpha(2),
                      AppConstants.cardColor,
                    ], begin: Alignment.topCenter, end: Alignment.center)
                    ), 
                    ),
                ),
        
                Positioned(
                  top: height * 0.05,
                  left: 05.0,
                  right: 05.0,
                  child: ChangeNotifierProvider(
                    create: (_) => LoginFormValidar(),
                    child: FormImputs()
                    )
                ),
        
                       
        
              ],
            )
           
            ),
      ),
    );
    //);
  }
}

class FormImputs extends StatefulWidget {
  
  const FormImputs({super.key});

  @override
  State<FormImputs> createState() => _FormImputsState();
}

class _FormImputsState extends State<FormImputs> {

  @override
  Widget build(BuildContext context) {
  
  ResponsiveUtil responsiveUtil = ResponsiveUtil(context);
  double responsiveHeight = responsiveUtil.getResponsiveHeight(0.10);
  

  return SingleChildScrollView(
    child: Container(
      height: 700,
      color: Colors.transparent,
      child: Column(
  children: [
    Text('Completa tu registro',
        style: GoogleFonts.roboto(
            fontSize: 28,
            color: AppConstants.textColor,
            shadows: <Shadow>[
              const Shadow(color: Colors.black87, blurRadius: 20.0)
            ])),
    const SizedBox(height: 10),
    ShaderMask(
      shaderCallback: (bounds) {
        return const RadialGradient(
            center: Alignment.topRight,
            radius: 4.0,
            colors: [
              Color.fromARGB(255, 99, 47, 241),
              Color.fromARGB(255, 42, 138, 248), 
            ]).createShader(bounds);
      },
      
    ),
    SizedBox(height: responsiveHeight),
    
    const ImputFormRegistration(),   
    
   
    
    
  ],
      ),
    ),
  );
}

}
