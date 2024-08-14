part of 'cameras_bloc.dart';

@immutable
abstract class CamerasEvent {}

////////////////////////////////////////////////////////////////////////////////

class LoginCamerasEvent extends CamerasEvent {
  final String host;
  final String email;
  final String password;

  LoginCamerasEvent(
      {required this.host, required this.email, required this.password});

  @override
  String toString() => 'LoginCamerasEvent { }';
}

////////////////////////////////////////////////////////////////////////////////

class ConnectCamerasEvent extends CamerasEvent {
  String host;
  String login;
  String password;

  ConnectCamerasEvent(
      {required this.host, required this.login, required this.password});

  @override
  String toString() => 'ConnectCamerasEvent { }';
}

class AbortCamerasEvent extends CamerasEvent {
  @override
  String toString() => 'AbortCamerasEvent { }';
}

class PreviewCamerasEvent extends CamerasEvent {
  @override
  String toString() => 'PreviewCamerasEvent { }';
}

////////////////////////////////////////////////////////////////////////////////
