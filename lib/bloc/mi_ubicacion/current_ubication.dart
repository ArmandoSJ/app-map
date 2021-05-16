part of 'current_ubication_bloc.dart';

@immutable
class CurrentUbicationState {

  final bool vSiguiendo;
  final bool vExisteUbicacion;
  final LatLng vUbicacion;

  CurrentUbicationState({
    this.vSiguiendo = true,
    this.vExisteUbicacion = false,
    this.vUbicacion
  }); 

  CurrentUbicationState copyWith({
    bool vSiguiendo,
    bool vExisteUbicacion,
    LatLng vUbicacion,
  }) => new CurrentUbicationState(
    vSiguiendo       : vSiguiendo ?? this.vSiguiendo,
    vExisteUbicacion : vExisteUbicacion ?? this.vExisteUbicacion,
    vUbicacion       : vUbicacion ?? this.vUbicacion,
  );
  

}
