part of 'events_bloc.dart';

enum EventsViewState {
  initial,
  success,
  inprogress,
  aborted,
  failed,
  video,
  refresh,
}

@immutable
class EventsState {
  final EventsViewState viewState;
  final AuthToken authToken;
  final List<VideoEvent> eventList;
  final List<GeoPoint> trackList;
  final double latitude;
  final double longitude;
  final String videoUrl;
  final String errorMessage;

  EventsState({
    required this.viewState,
    required this.authToken,
    required this.eventList,
    required this.trackList,
    required this.latitude,
    required this.longitude,
    required this.videoUrl,
    required this.errorMessage,
  });

  factory EventsState.initial() {
    return EventsState(
      viewState: EventsViewState.initial,
      authToken: AuthToken(session_id: "", session_type: ""),
      eventList: [],
      trackList: [],
      latitude: 0.0,
      longitude: 0.0,
      videoUrl: "",
      errorMessage: "",
    );
  }

  EventsState copyWithState({
    required EventsViewState viewState,
  }) {
    return EventsState(
      viewState: viewState,
      authToken: AuthToken(session_id: "", session_type: ""),
      eventList: [],
      trackList: [],
      latitude: 0.0,
      longitude: 0.0,
      videoUrl: "",
      errorMessage: "",
    );
  }

  EventsState copyWithStateAndContent({
    required EventsViewState viewState,
    required List<VideoEvent> eventList,
    required List<GeoPoint> trackList,
    required double latitude,
    required double longitude,
    required AuthToken authToken,
    required String errorMessage,
  }) {
    return EventsState(
      viewState: viewState,
      authToken: authToken,
      eventList: eventList,
      trackList: trackList,
      latitude: latitude,
      longitude: longitude,
      videoUrl: "",
      errorMessage: errorMessage,
    );
  }

  EventsState copyWithStateAndVideoUrls({
    required EventsViewState viewState,
    required String videoUrl,
  }) {
    return EventsState(
      viewState: viewState,
      authToken: AuthToken(session_id: "", session_type: ""),
      eventList: [],
      trackList: [],
      latitude: 0.0,
      longitude: 0.0,
      videoUrl: videoUrl,
      errorMessage: "",
    );
  }
}
