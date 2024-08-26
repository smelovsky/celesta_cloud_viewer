part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

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

class ConnectEventsEvent extends EventsEvent {
  String host;
  String login;
  String password;
  String cameraName;
  String session_id;

  ConnectEventsEvent({
    required this.host,
    required this.login,
    required this.password,
    required this.cameraName,
    required this.session_id,
  });

  @override
  String toString() => 'ConnectEventsEvent { }';
}

class AbortEventsEvent extends EventsEvent {
  @override
  String toString() => 'AbortEventsEvent { }';
}

class GetRtmpsSmilEvent extends EventsEvent {
  String host;
  String session_id;
  String videoEventId;
  String videoName;

  GetRtmpsSmilEvent({
    required this.host,
    required this.session_id,
    required this.videoEventId,
    required this.videoName,
  });

  @override
  String toString() => 'GetEventMediaUrlEvent { }';
}
