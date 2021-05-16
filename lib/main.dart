import 'package:app_map/bloc/mi_ubicacion/current_ubication_bloc.dart';
import 'package:app_map/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bloc/mapa/mapa_bloc.dart';
/*
 * developed by asalazarj
 */
void main() async {
  
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (_) => CurrentUbicationBloc()),
        BlocProvider(create: ( _ ) => MapaBloc() ),
      ],
      child: MaterialApp(
        title: 'app-profile',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ], 
        supportedLocales: [
            const Locale('en', 'US'), // English
            const Locale('es', 'ES'), // Spanish
        ],
        initialRoute: 'acceso_gps', 
        routes: getApplicationRoutes(),
        theme: ThemeData(
          primaryColor: Colors.blue.shade100,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue
          )
        ),  
       ),
    );
    
  }
}