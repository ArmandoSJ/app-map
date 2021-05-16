import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class OrderDetailActivity extends StatefulWidget {

  @override
  _OrderDetailActivityState createState() => _OrderDetailActivityState();
}

class _OrderDetailActivityState extends State<OrderDetailActivity> with WidgetsBindingObserver {

  @override
  void initState() {
    //tener el estado el widget
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  //obtener el cambio de la aplicacion, cuando es estado sea igual a resumed y la location is granted nos dirreccione a loading
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    
    if (  state == AppLifecycleState.resumed ) {
      if ( await Permission.location.isGranted  ) {
        Navigator.pushReplacementNamed(context, 'loading');
      }
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Orden es: 10302011'),
            Text('El estado de la orden es:'),
            Text('La direccion de la orden es: '),

            MaterialButton(
              child: Text('Ingresar al mapa', style: TextStyle( color: Colors.white )),
              color: Colors.black,
              shape: StadiumBorder(),
              elevation: 0,
              splashColor: Colors.transparent,
              onPressed: () async {
                
                final status = await Permission.location.request();

                this.gpsAccess( status );

              }
            )
          ],
        )
     ),
   );
  }

  /*
   * Metodo para validar el estado de la configuracion de gps
   */
  void gpsAccess( PermissionStatus status ) {


    switch ( status ) {
      
      case PermissionStatus.granted:
        Navigator.pushReplacementNamed(context, 'orden');
        break;
        
      case PermissionStatus.undetermined:
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
    }
    
  }
}