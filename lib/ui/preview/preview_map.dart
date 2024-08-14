import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class PreviewMap extends StatefulWidget {
  final double latitude;
  final double longitude;
  final double height;
  final double width;

  PreviewMap({
    Key? key,
    required this.latitude,
    required this.longitude,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<PreviewMap> createState() => _PreviewMap();
}

class _PreviewMap extends State<PreviewMap> with OSMMixinObserver {
  late MapController _mapController;

  @override
  void initState() {
    super.initState();

    _mapController = MapController(
      initPosition: GeoPoint(
        latitude: widget.latitude,
        longitude: widget.longitude,
      ),
    );
    _mapController.addObserver(this);
  }

  @override
  void dispose() {
    _mapController.dispose();

    super.dispose();
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      GeoPoint position =
          GeoPoint(latitude: widget.latitude, longitude: widget.longitude);

      _mapController.addMarker(
        position,
        markerIcon: MarkerIcon(
            iconWidget: SizedBox(
          width: 32,
          height: 64,
          child: Image.asset(
            "assets/images/default_pin.png",
            //scale: .3,
          ),
        )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Stack(children: [
          OSMFlutter(
            controller: _mapController,
            mapIsLoading: Center(
              child: CircularProgressIndicator(),
            ),
            osmOption: OSMOption(
              enableRotationByGesture: true,
              zoomOption: ZoomOption(
                initZoom: 14,
                minZoomLevel: 3,
                maxZoomLevel: 19,
                stepZoom: 1.0,
              ),
            ),
          ),
          Positioned(
            top: 8.0,
            left: 8.0,
            child: ZoomNavigation(
              controller: _mapController,
            ),
          )
        ]),
      ),
    );
  }
}

class ZoomNavigation extends StatelessWidget {
  const ZoomNavigation({
    super.key,
    required this.controller,
  });
  final MapController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PointerInterceptor(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              maximumSize: Size(48, 48),
              minimumSize: Size(24, 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent.withOpacity(0.1),
              side: BorderSide(
                width: 2,
                color: Colors.black,
              ),
              padding: EdgeInsets.zero,
            ),
            child: Center(
              child: Icon(Icons.add),
            ),
            onPressed: () async {
              controller.zoomIn();
            },
          ),
        ),
        SizedBox(
          height: 2,
        ),
        PointerInterceptor(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              maximumSize: Size(48, 48),
              minimumSize: Size(24, 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent.withOpacity(0.1),
              side: BorderSide(
                width: 2,
                color: Colors.black,
              ),
              padding: EdgeInsets.zero,
            ),
            child: Center(
              child: Icon(Icons.remove),
            ),
            onPressed: () async {
              controller.zoomOut();
            },
          ),
        ),
      ],
    );
  }
}
