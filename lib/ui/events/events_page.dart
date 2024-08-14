import 'dart:collection';

import 'package:celesta_cloud_viewer/ui/events/utils.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../app_state.dart';
import '../../freezed/responses/cloud_response.dart';
import '../preview/player/video_player.dart';
import 'events_bloc.dart';
import 'package:intl/intl.dart';

import 'events_filter.dart';
import 'events_map_view.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  final String restorationId = 'password_field';

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage>
    with RestorationMixin, OSMMixinObserver {
  EventsBloc? _eventsBloc;

  String url = "";
  String login = "";
  String password = "";
  String cameraName = "";
  String session_id = "";
  String device_id = "";

  final RestorableBool _obscureText = RestorableBool(true);

  bool isEventsEnable = false;
  bool isMapEnable = true;
  bool isCalendarEnable = true;

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  double _currentSliderValue = 0.0;

  List<VideoEvent> _eventList = [];
  List<GeoPoint> _trackList = [];
  List<VideoEvent> _eventsForDay = [];

  int _selector_index = 0;

  var _events = 0;

  late MapController mapController;
  var isMapControllerInited = false;

  @override
  void dispose() {
    if (isMapControllerInited) {
      mapController.dispose();
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _eventsBloc = BlocProvider.of<EventsBloc>(context);

    url = Provider.of<AppState>(context, listen: false).cloudUrl;
    login = Provider.of<AppState>(context, listen: false).cloudLogin;
    password = Provider.of<AppState>(context, listen: false).cloudPassword;
    cameraName = Provider.of<AppState>(context, listen: false).cameraName;
    session_id = Provider.of<AppState>(context, listen: false).session_id;

    print("initState EventsPageState ${cameraName} ${_trackList.length}");

    GeoPoint initPosition = (_trackList.length > 0)
        ? GeoPoint(
            latitude: _trackList[_selector_index].latitude,
            longitude: _trackList[_selector_index].longitude)
        : GeoPoint(latitude: 43.3197033, longitude: 132.1192263);

    mapController = MapController(
      initPosition: initPosition,
    );

    final isEventsInited =
        Provider.of<AppState>(context, listen: false).isEventsInited;

    if (!isEventsInited) {
      _eventsBloc!.add(ConnectEventsEvent(
        host: url,
        login: login,
        password: password,
        cameraName: cameraName,
        session_id: session_id,
        device_id: device_id,
      ));

      Provider.of<AppState>(context, listen: false).isEventsInited = true;
    }
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_obscureText, 'obscure_text');
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      isMapControllerInited = true;

      if (_trackList.length > 0) {
        GeoPoint position = GeoPoint(
            latitude: _trackList[_selector_index].latitude,
            longitude: _trackList[_selector_index].longitude);

        mapController.changeLocation(position);
      }

      print("_trackList: ${_trackList.length}");

      mapController.drawRoadManually(
          _trackList,
          RoadOption(
            zoomInto: true,
            roadColor: Colors.green,
            roadWidth: 10,
          ));
    }
  }

  List<String> _getEventsForDay(DateTime day) {
    List<String> events = [];

    _eventList.forEach((event) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(event.timestamp);

      if (dateTime.day == day.day &&
          dateTime.month == day.month &&
          dateTime.year == day.year) {
        events.add(event.meta.trigger);
      }
    });

    return events;
  }

  _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    print("_onDaySelected");
    setState(() {
      _focusedDay = focusedDay;
      _selectedDay = selectedDay;

      _applyFilter();

      _events = _eventsForDay.length;
    });
  }

  _applyFilter() {
    final adas = Provider.of<AppState>(context, listen: false).adasEventsFilter;
    final imu = Provider.of<AppState>(context, listen: false).imuEventsFilter;
    final gps = Provider.of<AppState>(context, listen: false).gpsEventsFilter;
    final dms = Provider.of<AppState>(context, listen: false).dmsEventsFilter;
    final stops =
        Provider.of<AppState>(context, listen: false).stopsEventsFilter;
    final other =
        Provider.of<AppState>(context, listen: false).otherEventsFilter;

    _eventsForDay = [];
    _eventList.forEach((event) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(event.timestamp);

      if (dateTime.day == _selectedDay.day &&
          dateTime.month == _selectedDay.month &&
          dateTime.year == _selectedDay.year &&
          (other == true ||
              adas == true && event.meta.trigger == "ADAS" ||
              imu == true && event.meta.trigger == "INU" ||
              gps == true && event.meta.trigger == "GPS" ||
              dms == true && event.meta.trigger == "DMS" ||
              stops == true && event.meta.trigger == "STOPS")) {
        _eventsForDay.add(event);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsBloc, EventsState>(
      bloc: _eventsBloc,
      listener: (BuildContext context, EventsState eventsState) {
        if (eventsState.viewState == EventsViewState.failed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Connection failed"), Icon(Icons.error)],
                ),
                backgroundColor: Colors.red,
              ),
            );
        } else {
          ScaffoldMessenger.of(context)..hideCurrentSnackBar();
        }
      },
      builder: (context, eventsState) {
        switch (eventsState.viewState) {
          case EventsViewState.initial:
          case EventsViewState.aborted:
          case EventsViewState.failed:
            return _initialView();

          case EventsViewState.inprogress:
            return _inprogressView();

          case EventsViewState.success:
            _eventList = eventsState.eventList;
            _trackList = eventsState.trackList;

            _applyFilter();

            return _successView(eventsState.mediaUrl, eventsState.errorMessage);

          default:
            return Container();
        }
      },
    );
    //);
  }

  Widget _actionView() {
    return ElevatedButton(
        child: Text('Connect'),
        onPressed: () {
          _eventsBloc!.add(ConnectEventsEvent(
            host: url,
            login: login,
            password: password,
            cameraName: cameraName,
            session_id: session_id,
            device_id: device_id,
          ));
        });
  }

  Widget _initialView() {
    return Center(
      child: _actionView(),
    );
  }

  Widget _inprogressView() {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CircularProgressIndicator(),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('Connecting...'),
        ),
        ElevatedButton(
          child: Text('Abort'),
          onPressed: () {
            _eventsBloc?.add(AbortEventsEvent());
          },
        ),
        if (!isLandscape)
          Padding(
            // TBD
            padding: const EdgeInsets.all(70.0),
          ),
      ],
    );
  }

  Widget _successView(String mediaUrl, String errorMessage) {
    if (!isEventsEnable) {
      return showEventsTab(mediaUrl, errorMessage);
    } else if (!isMapEnable) {
      return showMapTab(mediaUrl, errorMessage);
    } else
      return showCalendarTab(
        mediaUrl,
        errorMessage,
        DateTime.utc(2010, 10, 16),
        DateTime.utc(2030, 3, 14),
      );
  }

  Widget showEventsTab(String mediaUrl, String errorMessage) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("${cameraName}"),
            ],
          ),
          if (mediaUrl != "")
            VideoPlayer(
                mediaUrl: mediaUrl, autoPlay: true, isModalDialog: false)
          else
            Placeholder(errorMessage),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2.0),
          ),
          selector(),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("Recoded events ${_formattedDate(_selectedDay)}"),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              )),
              IconButton(
                iconSize: 24,
                icon: const Icon(Icons.filter),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => FilterPage(onApply: () {
                      setState(() {
                        _applyFilter();
                      });
                    }),
                  );
                },
              ),
            ],
          ),
          Flexible(
              child: Container(
            child: DataTable2(
                headingRowHeight: 30,
                dataRowHeight: 30,
                border: const TableBorder(
                    verticalInside: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Colors.grey)),
                columnSpacing: 12,
                horizontalMargin: 2,
                columns: [
                  DataColumn2(label: Text('Type'), fixedWidth: 100),
                  DataColumn2(label: Text('Description')),
                  DataColumn2(label: Text('Time'), fixedWidth: 70),
                  DataColumn2(label: Text('Speed'), fixedWidth: 80),
                ],
                rows: List<DataRow>.generate(
                    _eventsForDay.length,
                    (index) => DataRow(onLongPress: () {}, cells: [
                          DataCell(Text("${_eventsForDay[index].meta.trigger}",
                              overflow: TextOverflow.ellipsis)),
                          DataCell(Text(
                              "${_eventsForDay[index].meta.trigger_subtype}",
                              overflow: TextOverflow.ellipsis)),
                          DataCell(Text(
                              "${_formattedTime(_eventsForDay[index].timestamp)}",
                              overflow: TextOverflow.ellipsis)),
                          DataCell(Text(
                              "${_eventsForDay[index].meta.navi.s} kph",
                              overflow: TextOverflow.ellipsis)),
                        ]))),
          )),
        ],
      ),
    );
  }

  Widget Placeholder(String errorMessage) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        height: MediaQuery.of(context).size.width / (16 / 9),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Text(errorMessage),
          ),
        ));
  }

  Widget showMapTab(String mediaUrl, String errorMessage) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("${cameraName}"),
            ],
          ),
          if (mediaUrl != "")
            VideoPlayer(
                mediaUrl: mediaUrl, autoPlay: true, isModalDialog: false)
          else
            Placeholder(errorMessage),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2.0),
          ),
          selector(),
          Flexible(
              child: EventsMap(
            mapController: mapController,
            height: double.infinity,
            width: double.infinity,
            //)
          )),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Row(
              children: [
                Text("GNSS track selection:"),
                Expanded(child: SizedBox()),
                Text("11:25:00 - 20:12:00"),
              ],
            ),
          ),
          if (_trackList.length > 0)
            Slider(
              value: _currentSliderValue,
              max: _trackList.length.toDouble() - 1,
              divisions: _eventList.length,
              //label: "GNSS track selection:",
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                  _selector_index = value.toInt();

                  GeoPoint position = GeoPoint(
                      latitude: _trackList[_selector_index].latitude,
                      longitude: _trackList[_selector_index].longitude);
                  mapController.changeLocation(position);
                });
              },
            ),
        ],
      ),
    );
  }

  Widget showCalendarTab(
    String mediaUrl,
    String errorMessage,
    DateTime firstDay,
    DateTime lastDay,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("${cameraName}"),
            ],
          ),
          if (mediaUrl != "")
            VideoPlayer(
                mediaUrl: mediaUrl, autoPlay: true, isModalDialog: false)
          else
            Placeholder(errorMessage),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2.0),
          ),
          selector(),
          Container(
            height: 250,
            child: TableCalendar<String>(
                eventLoader: _getEventsForDay,
                calendarBuilders:
                    CalendarBuilders(todayBuilder: (context, day, focusedDay) {
                  return Container(
                    decoration: TableBoxDecoration(day, false),
                    child: Center(
                      child: ClipOval(
                        child: Container(
                          color: Colors.grey,
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          child: Text(
                            '${day.day}',
                          ),
                        ),
                      ),
                    ),
                  );
                }, outsideBuilder: (context, day, focusedDay) {
                  return Container(
                    decoration: TableBoxDecoration(day, true),
                    child: Center(
                      child: Text(
                        style: TextStyle(color: Colors.black12),
                        '${day.day}',
                      ),
                    ),
                  );
                }, defaultBuilder: (context, day, focusedDay) {
                  return Container(
                    decoration: TableBoxDecoration(day, false),
                    child: Center(
                      child: Text(
                        '${day.day}',
                      ),
                    ),
                  );
                }, dowBuilder: (context, day) {
                  final text = DateFormat.E().format(day);

                  return Center(
                      child: Text(
                    text,
                    //style: TextStyle(color: Colors.red),
                  ));
                }),
                headerStyle: HeaderStyle(
                  headerPadding: const EdgeInsets.symmetric(vertical: 0.0),
                  titleTextStyle: TextStyle(fontSize: 16),
                  formatButtonVisible: false,
                ),
                daysOfWeekHeight: 20,
                rowHeight: 30,
                firstDay: firstDay,
                lastDay: lastDay,
                currentDay: _selectedDay,
                focusedDay: _focusedDay,
                onDaySelected: _onDaySelected),
          ),
          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Statistics ${_formattedDate(_selectedDay)}"),
                ],
              ),
              color: Colors.amber),
          Flexible(
            child: Container(
                child: DataTable2(
              headingRowHeight: 20,
              dataRowHeight: 20,
              border: const TableBorder(
                  verticalInside: BorderSide(
                      width: 1, style: BorderStyle.solid, color: Colors.grey)),
              columnSpacing: 12,
              horizontalMargin: 2,
              columns: [
                DataColumn2(label: Text('Period'), fixedWidth: 80),
                DataColumn2(label: Text('Distance'), fixedWidth: 80),
                DataColumn2(label: Text('Time'), fixedWidth: 70),
                DataColumn2(label: Text('Stops'), fixedWidth: 50),
                DataColumn2(label: Text('Events'), fixedWidth: 50),
              ],
              rows: List<DataRow>.generate(3, (index) => dataRow(index)),
            )),
          ),
        ],
      ),
    );
  }

  DataRow dataRow(int index) {
    if (index == 0) {
      return DataRow(cells: [
        DataCell(Text("${_formattedDate(_selectedDay)}",
            overflow: TextOverflow.ellipsis)),
        DataCell(Text("0 km")),
        DataCell(Text("0h 0m")),
        DataCell(Text("0")),
        DataCell(Text("${_events}")),
      ]);
    } else if (index == 1) {
      return DataRow(cells: [
        DataCell(Text("week", overflow: TextOverflow.ellipsis)),
        DataCell(Text("0 km")),
        DataCell(Text("0h 0m")),
        DataCell(Text("0")),
        DataCell(Text("0")),
      ]);
    } else {
      return DataRow(cells: [
        DataCell(Text("month", overflow: TextOverflow.ellipsis)),
        DataCell(Text("0 km")),
        DataCell(Text("0h 0m")),
        DataCell(Text("0")),
        DataCell(Text("0")),
      ]);
    }
    ;
  }

  Widget selector() {
    return Container(
      height: 35,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Expanded(
          child: TextButton(
              child: Text("Events"),
              style: TextButton.styleFrom(
                  backgroundColor:
                      (isEventsEnable) ? Colors.black12 : Colors.white10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              onPressed: (isEventsEnable)
                  ? () {
                      setState(() {
                        isEventsEnable = false;
                        isMapEnable = true;
                        isCalendarEnable = true;
                      });
                    }
                  : null),
        ),
        Padding(
          padding: const EdgeInsets.all(1.0),
        ),
        Expanded(
          child: TextButton(
              child: Text("Map"),
              style: TextButton.styleFrom(
                  backgroundColor:
                      (isMapEnable) ? Colors.black12 : Colors.white10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              onPressed: (isMapEnable)
                  ? () {
                      setState(() {
                        isEventsEnable = true;
                        isMapEnable = false;
                        isCalendarEnable = true;

                        GeoPoint position = (_trackList.length > 0)
                            ? GeoPoint(
                                latitude: _trackList[_selector_index].latitude,
                                longitude:
                                    _trackList[_selector_index].longitude)
                            : GeoPoint(
                                latitude: 43.3197033, longitude: 132.1192263);

                        mapController = MapController(
                          initPosition: position,
                        );
                        mapController.addObserver(this);
                      });
                    }
                  : null),
        ),
        Padding(
          padding: const EdgeInsets.all(1.0),
        ),
        Expanded(
          child: TextButton(
              child: Text("Calendar"),
              style: TextButton.styleFrom(
                  backgroundColor:
                      (isCalendarEnable) ? Colors.black12 : Colors.white10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              onPressed: (isCalendarEnable)
                  ? () {
                      setState(() {
                        isEventsEnable = true;
                        isMapEnable = true;
                        isCalendarEnable = false;
                      });
                    }
                  : null),
        ),
      ]),
    );
  }

  BoxDecoration TableBoxDecoration(DateTime day, bool isOutside) {
    return BoxDecoration(
        color: (_getEventsForDay(day).length > 0)
            ? (isOutside)
                ? Colors.amberAccent
                : Colors.amber
            : (isOutside)
                ? Colors.white10
                : Colors.white,
        border: Border(
          right: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
          left: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
          top: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
          bottom: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
        ));
  }

  String _formattedTime(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final timeFormatter = DateFormat('HH:mm:ss');
    final formattedTime = timeFormatter.format(dateTime);
    return formattedTime;
  }

  String _formattedDate(DateTime date) {
    final dateFormatter = DateFormat('dd-MM-yyyy');
    final formattedDate = dateFormatter.format(date);
    return formattedDate;
  }
}
