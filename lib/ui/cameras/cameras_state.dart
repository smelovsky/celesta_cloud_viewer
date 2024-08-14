part of 'cameras_bloc.dart';

enum CamerasViewState {
  initial,
  success,
  inprogress,
  aborted,
  failed,
  preview,
}

@immutable
class CamerasState {
  final CamerasViewState viewState;
  final AuthToken authToken;
  final List<CameraDevice> deviceList;

  CamerasState({
    required this.viewState,
    required this.authToken,
    required this.deviceList,
  });

  factory CamerasState.initial() {
    return CamerasState(
      viewState: CamerasViewState.initial,
      authToken: AuthToken(session_id: "", session_type: ""),
      deviceList: [],
    );
  }

  CamerasState copyWithState({
    required CamerasViewState viewState,
  }) {
    return CamerasState(
      viewState: viewState,
      authToken: AuthToken(session_id: "", session_type: ""),
      deviceList: [],
    );
  }

  CamerasState copyWithStateAndAuthToken({
    required CamerasViewState viewState,
    required AuthToken authToken,
  }) {
    return CamerasState(
      viewState: viewState,
      authToken: authToken,
      deviceList: [],
    );
  }

  CamerasState copyWithStateAndDeviceListAndAuthToken({
    required CamerasViewState viewState,
    required List<CameraDevice> deviceList,
    required AuthToken authToken,
  }) {
    return CamerasState(
      viewState: viewState,
      authToken: authToken,
      deviceList: deviceList,
    );
  }
}
