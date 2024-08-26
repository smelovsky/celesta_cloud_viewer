import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_state.dart';
import '../../freezed/responses/cloud_response.dart';
import '../preview/preview_item.dart';
import 'camera_item.dart';
import 'cameras_bloc.dart';

class CamerasPage extends StatefulWidget {
  const CamerasPage({Key? key}) : super(key: key);

  final String restorationId = 'password_field';

  @override
  _CamerasPageState createState() => _CamerasPageState();
}

class _CamerasPageState extends State<CamerasPage> with RestorationMixin {
  CamerasBloc? _camerasBloc;

  List<CameraDevice> _cameraDeviceList = [];
  List<CameraDevice> _cameraDeviceListWithFilter = [];

  String url = "";
  String login = "";
  String password = "";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController? _camerasFilterController;

  final RestorableBool _obscureText = RestorableBool(true);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    print("_CamerasPageState initState ${_cameraDeviceList.length}");

    _camerasBloc = BlocProvider.of<CamerasBloc>(context);

    _camerasFilterController = TextEditingController(
        text: Provider.of<AppState>(context, listen: false).camerasFilter);

    url = Provider.of<AppState>(context, listen: false).cloudUrl;
    login = Provider.of<AppState>(context, listen: false).cloudLogin;
    password = Provider.of<AppState>(context, listen: false).cloudPassword;

    final isCamerasInited =
        Provider.of<AppState>(context, listen: false).isCamerasInited;

    if (!isCamerasInited) {
      _camerasBloc!.add(ConnectCamerasEvent(
        host: url,
        login: login,
        password: password,
      ));

      Provider.of<AppState>(context, listen: false).isCamerasInited = true;
    }
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_obscureText, 'obscure_text');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CamerasBloc, CamerasState>(
      bloc: _camerasBloc,
      listener: (BuildContext context, CamerasState camerasState) {
        if (camerasState.viewState == CamerasViewState.failed) {
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
      builder: (context, camerasState) {
        switch (camerasState.viewState) {
          //case CamerasViewState.initial:
          case CamerasViewState.aborted:
          case CamerasViewState.failed:
            return _initialView();

          case CamerasViewState.inprogress:
            return _inprogressView();

          case CamerasViewState.success:
            _cameraDeviceList = camerasState.deviceList;
            _applyFilter();

            return _successView(camerasState.authToken.session_id);

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
          _camerasBloc!.add(ConnectCamerasEvent(
            host: url,
            login: login,
            password: password,
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
            _camerasBloc?.add(AbortCamerasEvent());
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

  Future<void> _setCamerasFilter(String camerasFilter) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('cameras_filter', camerasFilter);

    _applyFilter();
  }

  void _applyFilter() {
    _cameraDeviceListWithFilter = [];

    final camerasFilter =
        Provider.of<AppState>(context, listen: false).camerasFilter;

    _cameraDeviceList.forEach((item) {
      if (camerasFilter.isEmpty ||
          item.device_display_name!.contains(camerasFilter)) {
        _cameraDeviceListWithFilter.add(item);
      }
    });
  }

  Widget _successView(String session_id) {
    final _node = FocusScope.of(context);

    var x = false;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
              child: TextField(
                  onTapOutside: (PointerDownEvent event) {
                    _camerasFilterController?.text =
                        Provider.of<AppState>(context, listen: false)
                            .camerasFilter;
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                      label: Text("Filter"),
                      hintText: 'Show all cameras',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  onEditingComplete: () {
                    Provider.of<AppState>(context, listen: false)
                        .isCamerasInited = false;
                    Provider.of<AppState>(context, listen: false)
                        .isEventsInited = false;
                    Provider.of<AppState>(context, listen: false)
                        .camerasFilter = _camerasFilterController!.text;

                    setState(() {
                      _setCamerasFilter(_camerasFilterController!.text);
                    });

                    _node.unfocus();
                  },
                  controller: _camerasFilterController,
                  maxLines: 1,
                  minLines: 1),
            ),
            Flexible(
                child: ListView.builder(
                    itemCount: _cameraDeviceListWithFilter.length,
                    itemBuilder: (context, index) {
                      return CameraItem(
                          item: _cameraDeviceListWithFilter[index],
                          onLongPress: (item) async {
                            final Future<SharedPreferences> _prefs =
                                SharedPreferences.getInstance();
                            final SharedPreferences prefs = await _prefs;
                            prefs.setString('camera_name', item.device_name!);

                            Provider.of<AppState>(context, listen: false)
                                .cameraName = item.device_name!;
                            Provider.of<AppState>(context, listen: false)
                                .isEventsInited = false;

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Selected '${item.device_display_name}'"),
                                    Icon(Icons.info)
                                  ],
                                ),
                                //backgroundColor: Colors.red,
                              ));
                          },
                          onTap: (item) {
                            //_camerasBloc?.add(PreviewCamerasEvent());
                            showDialog(
                              context: context,
                              builder: (_) => PreviewItem(
                                  session_id: session_id,
                                  device_name: item.device_name!,
                                  recent_geo_position:
                                      item.recent_geo_position!),
                            );
                          });
                    })),
          ],
        ));
  }
}
