import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keep_screen_on/keep_screen_on.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_state.dart';
import 'app_settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController? _cloudUrlController;
  TextEditingController? _cloudLoginController;
  TextEditingController? _cloudPasswordController;
  TextEditingController? _cameraNameController;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool keepScreenOn = true;
  String playerDataSourceTest = "";

  @override
  void initState() {
    super.initState();

    keepScreenOn = Provider.of<AppState>(context, listen: false).keepScreenOn;

    _cloudUrlController = TextEditingController(
        text: Provider.of<AppState>(context, listen: false).cloudUrl);

    _cloudLoginController = TextEditingController(
        text: Provider.of<AppState>(context, listen: false).cloudLogin);

    _cloudPasswordController = TextEditingController(
        text: Provider.of<AppState>(context, listen: false).cloudPassword);

    _cameraNameController = TextEditingController(
        text: Provider.of<AppState>(context, listen: false).cameraName);
  }

  @override
  void dispose() {
    _cloudUrlController?.dispose();
    _cloudLoginController?.dispose();
    _cloudPasswordController?.dispose();
    _cameraNameController?.dispose();

    super.dispose();
  }

  Future<void> _setCloudUrl(String url) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('cloud_url', url);
  }

  Future<void> _setCloudLogin(String login) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('cloud_login', login);
  }

  Future<void> _setCloudPassword(String password) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('cloud_password', password);
  }

  Future<void> _setCameraName(String cameraName) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('camera+name', cameraName);
  }

  Future<void> _setTheme(bool themeIsLight) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('theme', themeIsLight);
  }

  Future<void> _setKeepScreenOn() {
    return Future.wait([
      KeepScreenOn.isOn,
      KeepScreenOn.isAllowLockWhileScreenOn,
    ]).then((values) async {
      final _isKeepScreenOn = values.elementAtOrNull(0) ?? false;
      final SharedPreferences prefs = await _prefs;
      prefs.setBool('keep_screen_on', _isKeepScreenOn);

      print("keep_screen_on ${_isKeepScreenOn}");
    });
  }

  @override
  Widget build(BuildContext context) {
    final _node = FocusScope.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Dark theme: "),
                CupertinoSwitch(
                  value: isDark,
                  onChanged: (value) {
                    _setTheme(!value);
                    AppSettings.themeIsLight.value = !value;
                  },
                ),
                Text("Keep screen on: "),
                CupertinoSwitch(
                  value: keepScreenOn,
                  onChanged: (value) {
                    Provider.of<AppState>(context, listen: false).keepScreenOn =
                        value;

                    if (value) {
                      KeepScreenOn.turnOn().then((value) => _setKeepScreenOn());
                    } else {
                      KeepScreenOn.turnOff()
                          .then((value) => _setKeepScreenOn());
                    }

                    setState(() {
                      keepScreenOn = value;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
              child: TextField(
                  onTapOutside: (PointerDownEvent event) {
                    _cloudUrlController?.text =
                        Provider.of<AppState>(context, listen: false).cloudUrl;
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                      label: Text("URL"),
                      //helperText: 'URL',
                      hintText: 'Enter URL',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  onEditingComplete: () {
                    Provider.of<AppState>(context, listen: false).cloudUrl =
                        _cloudUrlController!.text;

                    setState(() {
                      _setCloudUrl(_cloudUrlController!.text);
                    });

                    _node.unfocus();
                  },
                  controller: _cloudUrlController,
                  maxLines: 1,
                  minLines: 1),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
              child: TextField(
                  onTapOutside: (PointerDownEvent event) {
                    _cloudLoginController?.text =
                        Provider.of<AppState>(context, listen: false)
                            .cloudLogin;
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                      label: Text("Login"),
                      //helperText: 'Login',
                      hintText: 'Enter login',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  onEditingComplete: () {
                    Provider.of<AppState>(context, listen: false)
                        .isCamerasInited = false;
                    Provider.of<AppState>(context, listen: false)
                        .isEventsInited = false;
                    Provider.of<AppState>(context, listen: false).cloudLogin =
                        _cloudLoginController!.text;

                    setState(() {
                      _setCloudLogin(_cloudLoginController!.text);
                    });

                    _node.unfocus();
                  },
                  controller: _cloudLoginController,
                  maxLines: 1,
                  minLines: 1),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
              child: TextField(
                  onTapOutside: (PointerDownEvent event) {
                    _cloudPasswordController?.text =
                        Provider.of<AppState>(context, listen: false)
                            .cloudPassword;
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                      label: Text("Password"),
                      //helperText: 'Password',
                      hintText: 'Enter Password',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  onEditingComplete: () {
                    Provider.of<AppState>(context, listen: false)
                        .cloudPassword = _cloudPasswordController!.text;

                    setState(() {
                      Provider.of<AppState>(context, listen: false)
                          .isCamerasInited = false;
                      Provider.of<AppState>(context, listen: false)
                          .isEventsInited = false;

                      _setCloudPassword(_cloudPasswordController!.text);
                    });

                    _node.unfocus();
                  },
                  controller: _cloudPasswordController,
                  maxLines: 1,
                  minLines: 1),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
              child: TextField(
                  onTapOutside: (PointerDownEvent event) {
                    _cameraNameController?.text =
                        Provider.of<AppState>(context, listen: false)
                            .cameraName;
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                      label: Text("Camera's Name"),
                      //helperText: "Camera's Name",
                      hintText: "Enter camera's name",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  onEditingComplete: () {
                    Provider.of<AppState>(context, listen: false).cameraName =
                        _cameraNameController!.text;

                    setState(() {
                      Provider.of<AppState>(context, listen: false)
                          .isEventsInited = false;

                      _setCameraName(_cameraNameController!.text);
                    });

                    _node.unfocus();
                  },
                  controller: _cameraNameController,
                  maxLines: 1,
                  minLines: 1),
            ),
          ],
        ));
  }
}
