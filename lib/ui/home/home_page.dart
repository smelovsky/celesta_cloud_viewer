import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keep_screen_on/keep_screen_on.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_state.dart';
import '../about/about_page.dart';
import '../cameras/cameras_page.dart';
import '../events/events_page.dart';
import '../settings/app_settings.dart';
import '../settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();

    _prefs.then((SharedPreferences prefs) {
      final themeIsLight = prefs.getBool('theme') ?? true;
      AppSettings.themeIsLight.value = themeIsLight;

      final camerasFilter = prefs.getString('cameras_filter') ?? "";
      Provider.of<AppState>(context, listen: false).camerasFilter =
          camerasFilter;

      final adasEventsFilter = prefs.getBool('adas_events_filter') ?? false;
      Provider.of<AppState>(context, listen: false).adasEventsFilter =
          adasEventsFilter;

      final imuEventsFilter = prefs.getBool('imu_events_filter') ?? false;
      Provider.of<AppState>(context, listen: false).imuEventsFilter =
          imuEventsFilter;

      final gpsEventsFilter = prefs.getBool('gps_events_filter') ?? false;
      Provider.of<AppState>(context, listen: false).gpsEventsFilter =
          gpsEventsFilter;

      final dmsEventsFilter = prefs.getBool('dms_events_filter') ?? false;
      Provider.of<AppState>(context, listen: false).dmsEventsFilter =
          dmsEventsFilter;

      final stopsEventsFilter = prefs.getBool('stops_events_filter') ?? false;
      Provider.of<AppState>(context, listen: false).stopsEventsFilter =
          stopsEventsFilter;

      final otherEventsFilter = prefs.getBool('other_events_filter') ?? true;
      Provider.of<AppState>(context, listen: false).otherEventsFilter =
          otherEventsFilter;

      final cloudLogin = prefs.getString('cloud_login') ?? "test@test.com";
      Provider.of<AppState>(context, listen: false).cloudLogin = cloudLogin;

      final cloudPassword = prefs.getString('cloud_password') ?? "test";
      Provider.of<AppState>(context, listen: false).cloudPassword =
          cloudPassword;

      final cloudUrl = prefs.getString('cloud_url') ??
          "https://api-rel1-ru-vl.celestacloud.com/";
      Provider.of<AppState>(context, listen: false).cloudUrl = cloudUrl;

      final keepScreenOn = prefs.getBool('keep_screen_on') ?? true;
      Provider.of<AppState>(context, listen: false).keepScreenOn = keepScreenOn;

      final cameraName = prefs.getString('camera_name') ?? "demotripcar";
      Provider.of<AppState>(context, listen: false).cameraName = cameraName;

      if (keepScreenOn) {
        KeepScreenOn.turnOn();
      } else {
        KeepScreenOn.turnOff();
      }
    });

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Celesta Cloud Viewer"),
          actions: [
            IconButton(icon: Icon(Icons.exit_to_app), onPressed: () => exit(0)),
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: [
              Tab(text: "About"),
              Tab(text: "Settings"),
              Tab(text: "Cameras"),
              Tab(text: "Events"),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            AboutPage(),
            SettingsPage(),
            CamerasPage(),
            EventsPage(),
          ],
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
