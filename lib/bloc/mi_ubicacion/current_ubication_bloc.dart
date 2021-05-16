import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'current_ubication_event.dart';
part 'current_ubication.dart';

class CurrentUbicationBloc extends Bloc<CurrentUbicationEvent, CurrentUbicationState> {
  
  CurrentUbicationBloc() : super(CurrentUbicationState());

  // Geolocator
  final _geolocator = new Geolocator();
  StreamSubscription<Position> _positionSubscription;


  void startTracking() {

    final locationOptions = LocationOptions(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10
    );

    _positionSubscription = this._geolocator.getPositionStream(locationOptions).listen(( Position position ) {
      final nuevaUbicacion = new LatLng(position.latitude, position.longitude);
      add( OnUbicacionCambio( nuevaUbicacion ) );
    });
  }

  void cancelTracking() {
    _positionSubscription?.cancel();
  }


  @override
  Stream<CurrentUbicationState> mapEventToState( CurrentUbicationEvent event ) async* {
    
    if ( event is OnUbicacionCambio ) {
      //print(event);
      yield state.copyWith(
        vExisteUbicacion: true,
        vUbicacion: event.vUbicacion
      );
    }

  }
}
