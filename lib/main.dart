import 'package:celesta_cloud_viewer/ui/celesta_app.dart';
import 'package:celesta_cloud_viewer/ui/core/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final _appState = AppState(
    keepScreenOn: true,
    camerasFilter: "",
    cloudUrl: "",
    cloudLogin: "",
    cloudPassword: "",
    cameraName: "",
    isCamerasInited: false,
    isEventsInited: false,
    session_id: "",
    adasEventsFilter: false,
    imuEventsFilter: false,
    gpsEventsFilter: false,
    dmsEventsFilter: false,
    stopsEventsFilter: false,
    otherEventsFilter: true,
  );

  Bloc.observer = AppBlocObserver();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: _appState),
      ],
      child: CelestaApp(),
    ),
  );
}
