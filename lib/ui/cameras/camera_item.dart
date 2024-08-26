import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../freezed/responses/cloud_response.dart';

class CameraItem extends StatelessWidget {
  final CameraDevice item;
  final Function(CameraDevice) onTap;
  final Function(CameraDevice) onLongPress;

  const CameraItem({
    Key? key,
    required this.item,
    required this.onTap,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        onLongPress(item);
      },
      onTap: () {
        onTap(item);
      },
      child: Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Color(0xFFFFFFFF)),
              right: BorderSide(color: Color(0xFFFFFFFF)),
              bottom: BorderSide(),
              top: BorderSide(),
            ),
          ),
          child: ListTile(
              title: Row(children: [
            if (item.recent_thumb_url == "")
              Text("No thumbnail")
            else
              Image.network(item.recent_thumb_url!, height: 60),
            Expanded(
                child: Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 00.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.device_display_name!,
                      overflow: TextOverflow.ellipsis,
                      textScaler: TextScaler.linear(0.8),
                    ),
                    if (item.recent_geo_position?.length == 2)
                    Text(
                          "${item.recent_geo_position?[0]}, ${item.recent_geo_position?[1]}")
                    else
                      Text("(no geo position)"),
                  ]),
            )),
          ]))),
    );
  }
}
