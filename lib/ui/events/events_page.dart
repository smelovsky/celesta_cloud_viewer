import 'dart:collection';

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
import 'event_player.dart';
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

  String cameraName = "";

  final RestorableBool _obscureText = RestorableBool(true);

  int _eventsPageTbIndex = 0;

  double _currentSliderValue = 0.0;

  List<VideoEvent> _eventsForDay = [];

  String _errorMessage = "";

  int _selector_index = 0;

  var _events = 0;

  late MapController mapController;
  var isMapControllerInited = false;

  bool _isFront = true;

  @override
  void dispose() {
    //if (isMapControllerInited) {
    //  mapController.dispose();
    //}

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _eventsBloc = BlocProvider.of<EventsBloc>(context);

    cameraName = Provider.of<AppState>(context, listen: false).cameraName;

    _isFront = Provider.of<AppState>(context, listen: false).isFront;
    _eventsPageTbIndex =
        Provider.of<AppState>(context, listen: false).eventsPageTbIndex;

    final isEventsInited =
        Provider.of<AppState>(context, listen: false).isEventsInited;
    final session_id = Provider.of<AppState>(context, listen: false).session_id;

    mapController = MapController(
      initPosition: GeoPoint(latitude: 43.3197033, longitude: 132.1192263),
    );

    if (Provider.of<AppState>(context, listen: false).eventsPageTbIndex == 1) {
      _eventsPageTbIndex = 0;
      Provider.of<AppState>(context, listen: false).eventsPageTbIndex == 0;
    }

    if (!isEventsInited) {
      _eventsBloc!.add(ConnectEventsEvent(
        host: Provider.of<AppState>(context, listen: false).cloudUrl,
        login: Provider.of<AppState>(context, listen: false).cloudLogin,
        password: Provider.of<AppState>(context, listen: false).cloudPassword,
        cameraName: cameraName,
        session_id: session_id,
      ));

      Provider.of<AppState>(context, listen: false).isEventsInited = true;
    } else {}
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_obscureText, 'obscure_text');
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    print("mapIsReady: ${isReady}");
    if (isReady) {
      isMapControllerInited = true;

      final trackList = Provider.of<AppState>(context, listen: false).trackList;
      print("trackList: ${trackList.length}");

      if (trackList.length > 0) {
        GeoPoint position = GeoPoint(
            latitude: trackList[_selector_index].latitude,
            longitude: trackList[_selector_index].longitude);

        mapController.changeLocation(position);
      }

      mapController.drawRoadManually(
          trackList,
          RoadOption(
            zoomInto: true,
            roadColor: Colors.green,
            roadWidth: 10,
          ));
    }
  }

  List<String> _getEventsForDay(DateTime day) {
    List<String> events = [];

    //Provider.of<AppState>(context, listen: false).selectedEventIndex = -1;

    final eventList = Provider.of<AppState>(context, listen: false).eventList;
    eventList.forEach((event) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(event.timestamp!);

      if (dateTime.day == day.day &&
          dateTime.month == day.month &&
          dateTime.year == day.year) {
        events.add(event.meta!.trigger!);
      }
    });

    return events;
  }

  _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    Provider.of<AppState>(context, listen: false).selectedDay = selectedDay;
    Provider.of<AppState>(context, listen: false).selectedEventIndex = -1;

    setState(() {
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
    final selectedDay =
        Provider.of<AppState>(context, listen: false).selectedDay;
    final eventList = Provider.of<AppState>(context, listen: false).eventList;

    _eventsForDay = [];
    eventList.forEach((event) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(event.timestamp!);

      if (dateTime.day == selectedDay.day &&
          dateTime.month == selectedDay.month &&
          dateTime.year == selectedDay.year &&
          (other == true ||
              adas == true && event.meta?.trigger == "ADAS" ||
              imu == true && event.meta?.trigger == "INU" ||
              gps == true && event.meta?.trigger == "GPS" ||
              dms == true && event.meta?.trigger == "DMS" ||
              stops == true && event.meta?.trigger == "STOPS")) {
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
        print("eventsState.viewState: ${eventsState.viewState}");

        switch (eventsState.viewState) {
          case EventsViewState.initial:
          case EventsViewState.aborted:
          case EventsViewState.failed:
            return _initialView();

          case EventsViewState.inprogress:
            return _inprogressView();

          case EventsViewState.video:
            Provider.of<AppState>(context, listen: false).videoUrl =
                eventsState.videoUrl;

            _applyFilter();

            return _successView();

          case EventsViewState.success:
            Provider.of<AppState>(context, listen: false).eventList =
                eventsState.eventList;
            Provider.of<AppState>(context, listen: false).session_id =
                eventsState.authToken.session_id;

            Provider.of<AppState>(context, listen: false).trackList =
                eventsState.trackList;

            Provider.of<AppState>(context, listen: false).videoUrl = "";
            Provider.of<AppState>(context, listen: false).selectedEventIndex =
                -1;

            _errorMessage = eventsState.errorMessage;

            _applyFilter();

            return _successView();

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
            host: Provider.of<AppState>(context, listen: false).cloudUrl,
            login: Provider.of<AppState>(context, listen: false).cloudLogin,
            password:
                Provider.of<AppState>(context, listen: false).cloudPassword,
            cameraName: cameraName,
            session_id:
                Provider.of<AppState>(context, listen: false).session_id,
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

  Widget _successView() {
    final eventsPageTbIndex = _eventsPageTbIndex;
    if (_eventsPageTbIndex == 0) {
      return showEventsTab();
    } else if (_eventsPageTbIndex == 1) {
      return showMapTab();
    } else
      return showCalendarTab(
        DateTime.utc(2010, 10, 16),
        DateTime.utc(2030, 3, 14),
      );
  }

  Widget showEventsTab() {
    final videoUrl = Provider.of<AppState>(context, listen: false).videoUrl;
    final selectedEventIndex =
        Provider.of<AppState>(context, listen: false).selectedEventIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(child: Text("${cameraName}")),
              if (selectedEventIndex != -1) Text("Front: "),
              if (selectedEventIndex != -1)
                CupertinoSwitch(
                  value: _isFront,
                  onChanged: (value) {
                    Provider.of<AppState>(context, listen: false).isFront =
                        value;

                    var videoName = (value)
                        ? (_eventsForDay[selectedEventIndex].videos!.length > 0)
                            ? _eventsForDay[selectedEventIndex].videos![0].name!
                            : ""
                        : (_eventsForDay[selectedEventIndex].videos!.length > 1)
                            ? _eventsForDay[selectedEventIndex].videos![1].name!
                            : "";
                    _eventsBloc?.add(GetRtmpsSmilEvent(
                      host: Provider.of<AppState>(context, listen: false)
                          .cloudUrl,
                      session_id: Provider.of<AppState>(context, listen: false)
                          .session_id,
                      videoEventId: _eventsForDay[selectedEventIndex].id!,
                      videoName: videoName,
                    ));

                    setState(() {
                      _isFront = value;
                    });
                  },
                ),
            ],
          ),
          if (videoUrl != "")
            //if (selectedEventIndex != -1)
            EventPlayer(mediaUrl: videoUrl)
          else
            _errorMessageBox(_errorMessage),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2.0),
          ),
          selector(),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                  "Recorded events ${_formattedDate(Provider.of<AppState>(context, listen: false).selectedDay)}"),
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
                onSelectAll: (b) {},
                showCheckboxColumn: false,
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
                    (index) => DataRow(
                            selected:
                                (index == selectedEventIndex) ? true : false,
                            onLongPress: () {
                              var videoName = (_isFront)
                                  ? (_eventsForDay[index].videos!.length > 0)
                                      ? _eventsForDay[index].videos![0].name!
                                      : ""
                                  : (_eventsForDay[index].videos!.length > 1)
                                      ? _eventsForDay[index].videos![1].name!
                                      : "";
                              _eventsBloc?.add(GetRtmpsSmilEvent(
                                host: Provider.of<AppState>(context,
                                        listen: false)
                                    .cloudUrl,
                                session_id: Provider.of<AppState>(context,
                                        listen: false)
                                    .session_id,
                                videoEventId: _eventsForDay[index].id!,
                                videoName: videoName,
                              ));

                              Provider.of<AppState>(context, listen: false)
                                  .selectedEventIndex = index;
                            },
                            cells: [
                              DataCell(
                                Text("${_eventsForDay[index].meta?.trigger}",
                                    overflow: TextOverflow.ellipsis),
                              ),
                              DataCell(Text(
                                  "${_eventsForDay[index].meta?.trigger_subtype}",
                                  overflow: TextOverflow.ellipsis)),
                              DataCell(Text(
                                  "${_formattedTime(_eventsForDay[index].timestamp!)}",
                                  overflow: TextOverflow.ellipsis)),
                              DataCell(Text(
                                  "${_eventsForDay[index].meta?.navi?.s} kph",
                                  overflow: TextOverflow.ellipsis)),
                            ]))),
          )),
        ],
      ),
    );
  }

  Widget _errorMessageBox(String errorMessage) {
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

  Widget showMapTab() {
    final videoUrl = Provider.of<AppState>(context, listen: false).videoUrl;
    final trackList = Provider.of<AppState>(context, listen: false).trackList;
    final selectedEventIndex =
        Provider.of<AppState>(context, listen: false).selectedEventIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(child: Text("${cameraName}")),
              if (selectedEventIndex != -1) Text("Front: "),
              if (selectedEventIndex != -1)
                CupertinoSwitch(
                  value: _isFront,
                  onChanged: (value) {
                    Provider.of<AppState>(context, listen: false).isFront =
                        value;

                    var videoName = (value)
                        ? (_eventsForDay[selectedEventIndex].videos!.length > 0)
                            ? _eventsForDay[selectedEventIndex].videos![0].name!
                            : ""
                        : (_eventsForDay[selectedEventIndex].videos!.length > 1)
                            ? _eventsForDay[selectedEventIndex].videos![1].name!
                            : "";
                    _eventsBloc?.add(GetRtmpsSmilEvent(
                      host: Provider.of<AppState>(context, listen: false)
                          .cloudUrl,
                      session_id: Provider.of<AppState>(context, listen: false)
                          .session_id,
                      videoEventId: _eventsForDay[selectedEventIndex].id!,
                      videoName: videoName,
                    ));

                    setState(() {
                      _isFront = value;
                    });
                  },
                ),
            ],
          ),
          if (videoUrl != "")
            EventPlayer(mediaUrl: videoUrl)
          else
            _errorMessageBox(_errorMessage),
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
          if (trackList.length > 0)
            Slider(
              value: _currentSliderValue,
              max: trackList.length.toDouble() - 1,
              divisions: trackList.length,
              //label: "GNSS track selection:",
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                  _selector_index = value.toInt();

                  GeoPoint position = GeoPoint(
                      latitude: trackList[_selector_index].latitude,
                      longitude: trackList[_selector_index].longitude);
                  mapController.changeLocation(position);
                });
              },
            ),
        ],
      ),
    );
  }

  Widget showCalendarTab(
    DateTime firstDay,
    DateTime lastDay,
  ) {
    final videoUrl = Provider.of<AppState>(context, listen: false).videoUrl;
    final selectedEventIndex =
        Provider.of<AppState>(context, listen: false).selectedEventIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(child: Text("${cameraName}")),
              if (selectedEventIndex != -1) Text("Front: "),
              if (selectedEventIndex != -1)
                CupertinoSwitch(
                  value: _isFront,
                  onChanged: (value) {
                    Provider.of<AppState>(context, listen: false).isFront =
                        value;

                    var videoName = (value)
                        ? (_eventsForDay[selectedEventIndex].videos!.length > 0)
                            ? _eventsForDay[selectedEventIndex].videos![0].name!
                            : ""
                        : (_eventsForDay[selectedEventIndex].videos!.length > 1)
                            ? _eventsForDay[selectedEventIndex].videos![1].name!
                            : "";
                    _eventsBloc?.add(GetRtmpsSmilEvent(
                      host: Provider.of<AppState>(context, listen: false)
                          .cloudUrl,
                      session_id: Provider.of<AppState>(context, listen: false)
                          .session_id,
                      videoEventId: _eventsForDay[selectedEventIndex].id!,
                      videoName: videoName,
                    ));

                    setState(() {
                      _isFront = value;
                    });
                  },
                ),
            ],
          ),
          if (videoUrl != "")
            EventPlayer(mediaUrl: videoUrl)
          else
            _errorMessageBox(_errorMessage),
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
                currentDay:
                    Provider.of<AppState>(context, listen: false).selectedDay,
                focusedDay:
                    Provider.of<AppState>(context, listen: false).selectedDay,
                onDaySelected: _onDaySelected),
          ),
          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      "Statistics ${_formattedDate(Provider.of<AppState>(context, listen: false).selectedDay)}"),
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
        DataCell(Text(
            "${_formattedDate(Provider.of<AppState>(context, listen: false).selectedDay)}",
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
                  backgroundColor: (_eventsPageTbIndex == 0)
                      ? Colors.black12
                      : Colors.white10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              onPressed: () {
                Provider.of<AppState>(context, listen: false)
                    .eventsPageTbIndex = 0;
                setState(() {
                  _eventsPageTbIndex = 0;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(1.0),
        ),
        Expanded(
            child: TextButton(
          child: Text("Map"),
          style: TextButton.styleFrom(
              backgroundColor:
                  (_eventsPageTbIndex == 1) ? Colors.black12 : Colors.white10,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero))),
          onPressed: () {
            Provider.of<AppState>(context, listen: false).eventsPageTbIndex = 1;
            final trackList =
                Provider.of<AppState>(context, listen: false).trackList;
            setState(() {
              _eventsPageTbIndex = 1;
              GeoPoint position = (trackList.length > 0)
                  ? GeoPoint(
                      latitude: trackList[_selector_index].latitude,
                      longitude: trackList[_selector_index].longitude)
                  : GeoPoint(latitude: 43.3197033, longitude: 132.1192263);

              mapController = MapController(
                initPosition: position,
              );
              mapController.addObserver(this);
            });
          },
        )),
        Padding(
          padding: const EdgeInsets.all(1.0),
        ),
        Expanded(
          child: TextButton(
              child: Text("Calendar"),
              style: TextButton.styleFrom(
                  backgroundColor: (_eventsPageTbIndex == 2)
                      ? Colors.black12
                      : Colors.white10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              onPressed: () {
                Provider.of<AppState>(context, listen: false)
                    .eventsPageTbIndex = 2;
                setState(() {
                  _eventsPageTbIndex = 2;
                });
              }),
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
