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
      resizeToAvoidBottomInset: false ,
      appBar: AppBar(title: Text("Detalle de servicios")),
      //resizeToAvoidBottomPadding: false ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CardDetail(),

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
            ),
            ContainerForm(),
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

class CardDetail extends StatelessWidget {
 final textStyle = TextStyle(fontSize: 15.0, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
      child: Column(
        children: <Widget>[
          ListTile(
            //leading: Text(' ', style: textStyle),
            title: Text('Orden es: 10302011', style: textStyle),
            subtitle: Text('El estado de la orden es:      \nLa direccion de la orden es:', style: textStyle),
          )
        ],
      ),
    );
  }
}

class ContainerForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>(); 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     child: Card(
       elevation: 10.0,
       shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
       child: Container(
         padding: EdgeInsets.all(5.0),
         child: Form(
           key: formKey,
           child: Column(
             children: <Widget>[
                SafeArea(
                 child: Container(
                     height: 45.0,
                     ),
               ),
               SizedBox(height: 3.0),
              Text('Pregunta 1', style: TextStyle(fontSize: 20.0)),
              TxtQuestion(),
              SizedBox(height: 12.0),
              Text('Pregunta 2', style: TextStyle(fontSize: 20.0)),
              TxtQuestion(),
              SizedBox(height: 12.0),
              Text('Pregunta 3', style: TextStyle(fontSize: 20.0)),
              TxtQuestion(),
              SizedBox(height: 12.0),
              Text('Pregunta 4', style: TextStyle(fontSize: 20.0)),
              TxtQuestion(),
              SizedBox(height: 12.0),
              Text('Pregunta 5', style: TextStyle(fontSize: 20.0)),
              TxtQuestion(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text('Guardar'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('Enviar'),
                    onPressed: () {},
                  )
                ],
              )         
             ],
           ),
         ),
       ),
     ),
      );
  }
}


class TxtQuestion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal:20.0), 
        child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(//decora el textfield
                  border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)//le da un radio de 20.0 a la caja de texto
                  ),
                  hintText: 'Ingrese su respuesta',
                  //labelText: 'Predio',
                            //errorText: snapshot.error
                ),
                        /* onSaved: (predioValue) => service.vPredio = predioValue,
                        validator: (predioValue) {
                          switch (utils.serviceValitaiton(predioValue)) {
                                case 'E':
                                  return 'Campo Obligatorio';
                                break;
                                case 'L':
                                  return 'Solo se permiten numeros';
                                break;
                                case 'M':
                                  return 'El predio debe de ser menor a 7 numeros';
                                case 'T':
                                  return null;
                                break;
                          }
                          return null;
                        }, */
        )
    );
  }
}
