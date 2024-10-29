import 'package:flutter/material.dart';
import 'package:usuario/responsive/responsive_ui.dart';

class AuthBackground extends StatelessWidget {
  
  
  final Widget child;

  const AuthBackground({
    super.key,
    required this.child,
    });

  @override
  Widget build(BuildContext context) {
    
    ResponsiveUtil responsiveUtil = ResponsiveUtil(context);
  
    double responsiveHeight = responsiveUtil.getResponsiveHeight(1.0); // Ejemplo de altura responsiva
    

    return SizedBox(
      
      width:  double.infinity,
      height: responsiveHeight,
      child: Stack(

        children: [

          _PurpleBox(),
          _HederIconLocation(),
         
          _HederIconText(),
           
          _HederIcon(),          
          child,

        ],
      ),

    );
  }
}

class _HederIcon extends StatelessWidget {
  const _HederIcon();

  @override
  Widget build(BuildContext context) {
    
    final responsiveUtil = ResponsiveUtil(context);
   
    double responsiveTop = responsiveUtil.getResponsiveHeight(0.17);   

    return Positioned(
      top: responsiveTop,
      left: 110,
      right: 110,
      child: Container(
        alignment: AlignmentDirectional.bottomCenter,
        height: 80,
        width: 150,
        margin: const EdgeInsets.only(top: 18),
        child: Image.asset('assets/driver.png'),
      ),
    );
  }
}

class _HederIconText extends StatelessWidget {


  
  const _HederIconText();

  @override
  Widget build(BuildContext context) {
    
    final responsiveUtil = ResponsiveUtil(context);

    final font = responsiveUtil.getResponsiveFontSize(16.0);
    double responsiveTop = responsiveUtil.getResponsiveHeight(0.08);
    double responsiveLeft = responsiveUtil.getResponsiveWidth(0.05); // Adjust the value to fit your design
    double responsiveRight = responsiveUtil.getResponsiveWidth(0.05);
    
    return Positioned(
      top: responsiveTop,
      left: responsiveLeft,
      right: responsiveRight,
      child: Container(
        alignment: AlignmentDirectional.bottomCenter,
        margin: const EdgeInsets.only(top: 45),
        child: Text(
          'I N R I   R E M I S E S',
          style: TextStyle(fontSize: font, fontFamily: 'Lobster', color: Colors.white),
        ),
      ),
    );
  }
}

class _HederIconLocation extends StatelessWidget {
  const _HederIconLocation();

  @override
  Widget build(BuildContext context) {

    final responsiveUtil = ResponsiveUtil(context);
    final font = responsiveUtil.getResponsiveFontSize(6.0);
    return Positioned(
                top: 5,
                left: 105,
                right: 105,
      child: Container(
        alignment: AlignmentDirectional.bottomCenter,     
        margin: const EdgeInsets.only(top: 16),           
        child: Icon(Icons.location_on,
         color:  Colors.white,
         size: font ,

         ),        
      ),
    );
  }
}



class _PurpleBox extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
  final size = MediaQuery.of(context).size;
  
    return Container(
      width: double.infinity,
      height: size.height * 0.5,      
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(top: 90, left: 30,child: _Bubble(),),
          Positioned(top: -40, left: -30,child: _Bubble(),),
          Positioned(top: -50, right: -20,child: _Bubble(),),
          Positioned(bottom: -50, left: 10,child: _Bubble(),),
          Positioned(bottom: 120, right: 20,child: _Bubble(),), 
      ],  
      ),
    );
  }

  BoxDecoration _purpleBackground() => BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ] 
      )
  );
}
class _Bubble extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}