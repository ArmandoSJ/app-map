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
      body: ListOfValues(),
    );
  }

  
}

class ListOfValues extends StatelessWidget {
  final servicesProvider = new ServiceProvider();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: servicesProvider.getData(),
        builder: ( BuildContext context, AsyncSnapshot<List<UserData>> snapshot ){

            if(snapshot.hasData){
              final vServices = snapshot.data;
              return ListView.separated(
                  itemCount: vServices.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (contex, i) {
                    //_lstService = vServices;
                    return SlidableComponent();
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


class SlidableComponent extends StatelessWidget {

  SlidableComponent({Key key}) : super(key: key);

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
          child: ListView(),
    );
  }
}

class ListApp extends StatelessWidget {
  UserData userData; 

  ListApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 0,
          ),
          title: Text("Request"),
          subtitle: Text("Action"),
      );
  }
}