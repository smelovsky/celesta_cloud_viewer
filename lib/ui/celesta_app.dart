import 'package:celesta_cloud_viewer/ui/preview/preview_item.bloc.dart';
import 'package:celesta_cloud_viewer/ui/settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/app_theme.dart';
import 'cameras/cameras_bloc.dart';
import 'events/events_bloc.dart';
import 'home/home_page.dart';

class CelestaApp extends StatefulWidget {
  const CelestaApp({Key? key}) : super(key: key);

  @override
  State<CelestaApp> createState() => _CelestaAppState();
}

class _CelestaAppState extends State<CelestaApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: AppSettings.themeIsLight,
        builder: (_, isLight, __) => MultiBlocProvider(
              providers: [
                BlocProvider<CamerasBloc>(create: (context) => CamerasBloc()),
                BlocProvider<EventsBloc>(create: (context) => EventsBloc()),
                BlocProvider<PreviewItemBloc>(
                    create: (context) => PreviewItemBloc()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: isLight ? AppTheme.lightTheme : AppTheme.darkTheme,
                home: HomePage(),
              ),
            ));
  }
}
