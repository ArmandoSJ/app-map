part of 'current_ubication_bloc.dart';

@immutable
abstract class CurrentUbicationEvent {}

class OnUbicacionCambio extends CurrentUbicationEvent {

  final LatLng vUbicacion;
  OnUbicacionCambio(this.vUbicacion);

}
