import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:usuario/pages/alarm_page.dart';
import 'package:usuario/pages/auctions.dart';
import 'package:usuario/pages/info_profile.dart';

import 'package:usuario/pages/notifications_access.dart';
import 'package:usuario/pages/order_page.dart';
import 'package:usuario/pages/order_register.dart';
import 'package:usuario/pages/privacy_page.dart';
import 'package:usuario/pages/shipping_details.dart';
import 'package:usuario/providers/login_form_validar.dart';
import 'package:usuario/routes/routes.dart';
import 'package:usuario/service/addresses_service.dart';
import 'package:usuario/service/auth_service.dart';
import 'package:usuario/blocs/blocs.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/number_symbols_data.dart';

import 'package:intl/number_symbols.dart';
import 'package:usuario/config/namber_symbol.dart';
//import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:usuario/splash/splash_screen.dart';



Future<void> main() async{
     
     //proyecto final usuarios duelo envios
     WidgetsFlutterBinding.ensureInitialized();
     
      //await AndroidAlarmManager.initialize();     
     

     HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );     
     
    

    Intl.defaultLocale = 'es_ARG';
    initializeDateFormatting('es_ARG', null);  
    final enUS = numberFormatSymbols['en_US'] as NumberSymbols;
    numberFormatSymbols['es_ARG'] = enUS.copyWith(
      currencySymbol: r'$',
    );
    

    await dotenv.load(fileName: ".env");   


runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginFormValidar()),
      ],
      child: MultiBlocProvider(
        providers: [
      
          BlocProvider(create: (context) => AuthBloc(authService: AuthService())),
          BlocProvider(create: (context) => GpsBloc() ),
          BlocProvider(create: (context) => NotificationBloc()),
          BlocProvider(create: (context) => AlarmBloc()),                
          BlocProvider(create: (context) => LocationBloc() ),
          BlocProvider(create: (context) => AddressBloc(addressService: AddressService(), authBloc: BlocProvider.of<AuthBloc>(context)) ),        
          BlocProvider(create: (context) => MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context),
         addressBloc: BlocProvider.of<AddressBloc>(context),)),
         BlocProvider(create: (context) => NavigatorBloc()),
          
        ],
      
        child: const MyApp() 
        ),
    )
  );
   
 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'usuario duelo envios',
      initialRoute: 'home', //aqui poner login
      routes: {
        'login'   : (BuildContext context) => const LoginPage(),
        'privacy' : (BuildContext context) => const PrivacyPage(),
        'register': (BuildContext context) => const RegisterPage(),
        'home'    : (BuildContext context) => const HomePage(),
        'loading' : (BuildContext context) => const LoadingPage(),
        'gps'     : (BuildContext context) => const GpsAccessPage(),
        'notification': (BuildContext context) => const NotificationsAccessPage(),
        'alarm'   : (BuildContext context)     => const AlarmAccessPage(),
        'splash': (BuildContext context) => const SplashScreen(),
        'info': (BuildContext context) => const InfoProfile(),
        'order': (BuildContext context) => const OrderRegister(),
        'detail': (BuildContext context) => const ShippingDetails(),
        'auctions': (BuildContext context) => const Auctions(),
        'orders': (BuildContext context) => const OrderPage(),// todas las ordenes
        
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300]
      ),

    );
  }

  
}



 


 