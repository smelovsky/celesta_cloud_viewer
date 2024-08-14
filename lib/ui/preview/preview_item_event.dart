part of 'preview_item.bloc.dart';

@immutable
abstract class PreviewItemEvent {}

class ConnectPreviewItemEvent extends PreviewItemEvent {
  String host;
  String session_id;
  String device_id;

  ConnectPreviewItemEvent(
      {required this.host, required this.session_id, required this.device_id});

  @override
  String toString() => 'ConnectPreviewItemEvent { }';
}

class AbortPreviewItemEvent extends PreviewItemEvent {
  @override
  String toString() => 'AbortPreviewItemEvent { }';
}
