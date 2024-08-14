part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

////////////////////////////////////////////////////////////////////////////////

class LoginEventsEvent extends EventsEvent {
  final String host;
  final String email;
  final String password;
  final String cameraName;

  LoginEventsEvent(
      {required this.host,
      required this.email,
      required this.password,
      required this.cameraName});

  @override
  String toString() => 'LoginEventsEvent { }';
}

////////////////////////////////////////////////////////////////////////////////

class ConnectEventsEvent extends EventsEvent {
  String host;
  String login;
  String password;
  String cameraName;
  String session_id;
  String device_id;

  ConnectEventsEvent({
    required this.host,
    required this.login,
    required this.password,
    required this.cameraName,
    required this.session_id,
    required this.device_id,
  });

  @override
  String toString() => 'ConnectEventsEvent { }';
}

class AbortEventsEvent extends EventsEvent {
  @override
  String toString() => 'AbortEventsEvent { }';
}

class GeoEventsEvent extends EventsEvent {
  double latitude;
  double longitude;

  GeoEventsEvent({required this.latitude, required this.longitude});

  @override
  String toString() => 'GeoEventsEvent { }';
}

////////////////////////////////////////////////////////////////////////////////
