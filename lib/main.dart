import 'package:app_map/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
/*
 * developed by asalazarj
 */
void main() async {
  
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          initialRoute: 'scroll', 
          routes: getApplicationRoutes(),
          theme: ThemeData(
            primaryColor: Colors.blue.shade100,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue
            )
          ),  
     );
    
  }
}