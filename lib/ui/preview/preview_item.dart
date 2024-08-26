import 'package:celesta_cloud_viewer/ui/preview/preview_map.dart';
import 'package:celesta_cloud_viewer/ui/preview/preview_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_state.dart';
import 'preview_item.bloc.dart';

class PreviewItem extends StatefulWidget {
  final String session_id;
  final String device_name;
  final List<double> recent_geo_position;

  const PreviewItem({
    Key? key,
    required this.session_id,
    required this.device_name,
    required this.recent_geo_position,
  }) : super(key: key);

  final String restorationId = '55';

  @override
  _PreviewItemState createState() => _PreviewItemState();
}

class _PreviewItemState extends State<PreviewItem> with RestorationMixin {
  PreviewItemBloc? _previewItemBloc;

  String cloudUrl = "";
  var latitude = 43.3197033;
  var longitude = 132.1192263;

  final RestorableBool _obscureText = RestorableBool(true);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _previewItemBloc = BlocProvider.of<PreviewItemBloc>(context);
    cloudUrl = Provider.of<AppState>(context, listen: false).cloudUrl;

    _previewItemBloc!.add(ConnectPreviewItemEvent(
      host: cloudUrl,
      session_id: widget.session_id,
      device_id: widget.device_name,
    ));

    if (widget.recent_geo_position.length == 2) {
      latitude = widget.recent_geo_position[1];
      longitude = widget.recent_geo_position[0];
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
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return BlocConsumer<PreviewItemBloc, PreviewItemState>(
      bloc: _previewItemBloc,
      listener: (BuildContext context, PreviewItemState previewItemState) {},
      builder: (context, previewItemState) {
        return _portraitPreview(previewItemState);
      },
    );
  }

  Widget _portraitPreview(PreviewItemState previewItemState) {
    switch (previewItemState.screenState) {
      case PreviewItemScreenState.inprogress:
        return AlertDialog(
          title: Text('Connecting...'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          //),

          actions: <Widget>[
            TextButton(
              child: const Text("Abort"),
              onPressed: () {
                _previewItemBloc!.add(AbortPreviewItemEvent());
                Navigator.of(context).pop();
              },
            ),
          ],
        );

      case PreviewItemScreenState.failed:
        return AlertDialog(
          title: Text('Error'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(previewItemState.errorMessage),
            ],
          ),
          //),

          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                //_previewItemBloc!.add(AbortPreviewItemEvent());
                Navigator.of(context).pop();
              },
            ),
          ],
        );

      case PreviewItemScreenState.success:
        return AlertDialog(
          title: Text(widget.device_name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (previewItemState.mediaUrl != "")
                Flexible(
                    child: PrviewPlayer(
                  mediaUrl: previewItemState.mediaUrl,
                ))
              else
                Flexible(
                  child: _errorMessageBox(previewItemState.errorMessage),
                ),
              Flexible(
                  child: Padding(padding: const EdgeInsets.only(top: 0.0))),
              Flexible(
                  child: PreviewMap(
                latitude: latitude,
                longitude: longitude,
                height: 200,
                width: double.infinity,
              )),
            ],
          ),
          //),

          actions: <Widget>[
            TextButton(
              child: const Text("Set as default"),
              onPressed: () async {
                final Future<SharedPreferences> _prefs =
                    SharedPreferences.getInstance();
                final SharedPreferences prefs = await _prefs;
                prefs.setString('camera_name', widget.device_name);

                Provider.of<AppState>(context, listen: false).cameraName =
                    widget.device_name;
                Provider.of<AppState>(context, listen: false).isEventsInited =
                    false;

                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      default:
        return Container();
    }
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
}
