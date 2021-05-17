import 'package:app_map/backend/user_data.dart';
import 'package:app_map/providers/services_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_map/constants/constants.dart' as constants;
import 'package:flutter_slidable/flutter_slidable.dart';

class ListActivity extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(constants.LIST_MENU_TITLE),
      ),
      body: _lista(),
    );
  }

  
}

class ListOfValues extends StatelessWidget {
  final servicesProvider = new ServiceProvider();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: servicesProvider.getData(),
        builder: ( BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ){

            if(snapshot.hasData){
              final vServices = snapshot.data;
              return ListView.separated(
                  itemCount: vServices.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (contex, i) {
                    //_lstService = vServices;
                    //return _lista(vServices[i]["requestid"],  i);
                    //return SlidableComponent(vServices, i);
                  } 
                //children: _listaItems( snapshot.data, context ),
              );  
            }else{
              return Center(child: CircularProgressIndicator());
            }
        },
    );
  }
}


Widget _lista() {
    final servicesProvider = new ServiceProvider();
    // menuProvider.cargarData()
    return FutureBuilder(
      future: servicesProvider.getData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ){

        return ListView(
          children: _listaItems( snapshot.data, context ),
        );

      },
    );

  

    

  }

  List<Widget> _listaItems( List<dynamic> data, BuildContext context ) {

    final List<Widget> opciones = [];


    data.forEach( (opt) {

      final widgetTemp = ListTile(
        title: Text( opt['requestid'] ),
        //leading:  Icon ( Icons.room_service, color: Colors.blue ) ,
        trailing: TextButton(  
            child: Text('Relizado'),
            style: TextButton.styleFrom(
                   primary: Colors.black,
                   backgroundColor: Colors.blue.shade200,
                   textStyle: TextStyle(fontSize: 15),
                   shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                  ),
            ),
            onPressed: () { Navigator.pushNamed(context, "acceso_gps" ); },
        ),
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

    });

    return opciones;

  }

class SlidableComponent extends StatefulWidget {
  
  List<dynamic> _lstServices;
  
  SlidableComponent(this._lstServices);

  @override
  _SlidableComponentState createState() => _SlidableComponentState();
}

class _SlidableComponentState extends State<SlidableComponent> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          closeOnScroll: false,
          actions: <Widget>[
              IconSlideAction(
                caption: 'Ocultar',
                color: Colors.green,
                icon: Icons.visibility_off,
                onTap: () => {},
              ),
            ],
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Borrar',
                color: Colors.red,
                icon: Icons.delete_forever,
                onTap: ()  => {},
              ),
            ],
          child: ListApp(widget._lstServices),
    );
  }
}

class ListApp extends StatefulWidget {
   List<dynamic> _lstServices;

  ListApp(this._lstServices);

  @override
  _ListAppState createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  @override
  Widget build(BuildContext context) {
      return ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 0,
          ),
          title: Text(widget._lstServices[0] + "Request"),
          subtitle: Text(widget._lstServices[0] + "Action"),
      );
  }
}