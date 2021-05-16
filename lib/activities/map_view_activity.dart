import 'package:app_map/activities/order_detail_activity.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart' ;
import 'package:permission_handler/permission_handler.dart';

import 'package:app_map/utils/helpers.dart';
import 'package:app_map/activities/map_activity.dart';


class MapViewActivity extends StatefulWidget {

  @override
  _MapViewActivityState createState() => _MapViewActivityState();
}

class _MapViewActivityState extends State<MapViewActivity> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    
    if (  state == AppLifecycleState.resumed ) {
      if ( await Geolocator().isLocationServiceEnabled()  ) {
        Navigator.pushReplacement(context, navegarMapaFadeIn(context, MapActivity() ));
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.checkGpsAndLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
  
          if ( snapshot.hasData ) {
            return Center(child: Text( snapshot.data ) ); //mostramos el error si llegara a pasar algo.
          } else {
            return Center(child: CircularProgressIndicator(strokeWidth: 2 ) );
          }
          
        },
      ),
   );
  }

  Future checkGpsAndLocation( BuildContext context ) async {

    // PermisoGPS
    final permisoGPS = await Permission.location.isGranted;
    // GPS está activo
    final gpsActivo  = await Geolocator().isLocationServiceEnabled();

    if ( permisoGPS && gpsActivo ) {
      Navigator.pushReplacement(context, navegarMapaFadeIn(context, MapActivity() ));
      return '';
    } else if ( !permisoGPS ) {
      Navigator.pushReplacement(context, navegarMapaFadeIn(context, OrderDetailActivity() ));  
      return 'Es necesario el permiso de GPS';
    } else {
      return 'Active el GPS';
    }

  }
}