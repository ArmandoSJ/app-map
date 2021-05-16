import 'package:app_map/bloc/mapa/mapa_bloc.dart';
import 'package:app_map/bloc/mi_ubicacion/current_ubication_bloc.dart';
import 'package:app_map/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapActivity extends StatefulWidget {

  @override
  _MapActivityState createState() => _MapActivityState();
}

class _MapActivityState extends State<MapActivity> {


   @override
  void initState() {
    BlocProvider.of<CurrentUbicationBloc>(context).startTracking();
    super.initState();
  }
 
  @override
  void dispose() {
    BlocProvider.of<CurrentUbicationBloc>(context).cancelTracking();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<CurrentUbicationBloc, CurrentUbicationState>(
        builder: ( _ , state)  => crearMapa( state )
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          //BtnUbicacion(),

        ],
      ),
   );

  }

  Widget crearMapa(CurrentUbicationState state ) {

    if ( !state.vExisteUbicacion ) return Center(child: Text('Ubicando...'));

    final mapaBloc = BlocProvider.of<MapaBloc>(context);

    final cameraPosition = new CameraPosition(
      target: state.vUbicacion,
      zoom: 15
    );

    return GoogleMap(
      initialCameraPosition: cameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: mapaBloc.initMapa,
    );

  }

}