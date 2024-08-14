import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_state.dart';

class FilterPage extends StatefulWidget {
  final Function() onApply;

  const FilterPage({
    Key? key,
    required this.onApply,
  }) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var _adas = false;
  var _imu = false;
  var _gps = false;
  var _dms = false;
  var _stops = false;
  var _other = true;

  @override
  void initState() {
    super.initState();

    _adas = Provider.of<AppState>(context, listen: false).adasEventsFilter;
    _imu = Provider.of<AppState>(context, listen: false).imuEventsFilter;
    _gps = Provider.of<AppState>(context, listen: false).gpsEventsFilter;
    _dms = Provider.of<AppState>(context, listen: false).dmsEventsFilter;
    _stops = Provider.of<AppState>(context, listen: false).stopsEventsFilter;
    _other = Provider.of<AppState>(context, listen: false).otherEventsFilter;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
              title: Text("ADAS"),
              value: _adas,
              onChanged: (newValue) {
                setState(() {
                  _adas = newValue!;
                });
              }),
          CheckboxListTile(
              title: Text("IMU"),
              value: _imu,
              onChanged: (newValue) {
                setState(() {
                  _imu = newValue!;
                });
              }),
          CheckboxListTile(
              title: Text("GPS"),
              value: _gps,
              onChanged: (newValue) {
                setState(() {
                  _gps = newValue!;
                });
              }),
          CheckboxListTile(
              title: Text("DMS"),
              value: _dms,
              onChanged: (newValue) {
                setState(() {
                  _dms = newValue!;
                });
              }),
          CheckboxListTile(
              title: Text("Stops"),
              value: _stops,
              onChanged: (newValue) {
                setState(() {
                  _stops = newValue!;
                });
              }),
          CheckboxListTile(
              title: Text("Other"),
              value: _other,
              onChanged: (newValue) {
                setState(() {
                  _other = newValue!;
                });
              }),
        ],
      ),
      //),

      actions: <Widget>[
        TextButton(
          child: const Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("Apply"),
          onPressed: () async {
            final Future<SharedPreferences> prefsInstance =
                SharedPreferences.getInstance();

            final SharedPreferences prefs = await prefsInstance;

            Provider.of<AppState>(context, listen: false).adasEventsFilter =
                _adas;
            prefs.setBool('adas_events_filter', _adas);

            Provider.of<AppState>(context, listen: false).imuEventsFilter =
                _imu;
            prefs.setBool('imu_events_filter', _imu);

            Provider.of<AppState>(context, listen: false).gpsEventsFilter =
                _gps;
            prefs.setBool('gps_events_filter', _gps);

            Provider.of<AppState>(context, listen: false).dmsEventsFilter =
                _dms;
            prefs.setBool('dms_events_filter', _dms);

            Provider.of<AppState>(context, listen: false).stopsEventsFilter =
                _stops;
            prefs.setBool('stops_events_filter', _stops);

            Provider.of<AppState>(context, listen: false).otherEventsFilter =
                _other;
            prefs.setBool('other_events_filter', _other);

            widget.onApply();

            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
