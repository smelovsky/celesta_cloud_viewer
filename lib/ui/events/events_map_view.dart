import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class EventsMap extends StatefulWidget {
  MapController mapController;
  final double height;
  final double width;

  EventsMap({
    Key? key,
    required this.mapController,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<EventsMap> createState() => _EventsMap();
}

class _EventsMap extends State<EventsMap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.mapController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Stack(children: [
          OSMFlutter(
            controller: widget.mapController,
            mapIsLoading: Center(
              child: CircularProgressIndicator(),
            ),
            osmOption: OSMOption(
              showContributorBadgeForOSM: false,
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
              controller: widget.mapController,
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
