import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usuario/blocs/navigator/navigator_bloc.dart';



class CustomButtonBar extends StatelessWidget {
  const CustomButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
   
   final heigthScreen = MediaQuery.of(context).size.height;//62.0

    return Container(
      width: double.infinity,
      height: heigthScreen < 650? 50.0 : 62.0,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 2)),
      child: BlocBuilder<NavigatorBloc, CustomNavigatorState>(
          builder: (context, navigatorState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [


           // Person Icon Button
              _buildNavItem(
                context,
                icon: Icons.person,
                index: 1,
                selectedIndex: navigatorState.selectedIndex,
              ),
              // Home Icon Button
              _buildNavItem(
                context,
                icon: Icons.home,
                index: 0,
                selectedIndex: navigatorState.selectedIndex,
              ),
              // Local Shipping Icon Button
              _buildNavItem(
                context,
                icon: Icons.local_shipping,
                index: 2,
                selectedIndex: navigatorState.selectedIndex,
              ),
          ],
        );
      }),
    );
  }
}


// Reusable function for navigation items
  Widget _buildNavItem(BuildContext context,
      {required IconData icon,
      required int index,
      required int selectedIndex}) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        context.read<NavigatorBloc>().add(BottomNavItemSelected(index));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated Icon
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(isSelected ? 4.0 : 8.0),
            child: Icon(
              icon,
              size: isSelected ? 30.0 : 24.0,
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
          // Indicator Line
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 30.0,
            height: isSelected ? 3.0 : 0.0, // Line height when selected
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
