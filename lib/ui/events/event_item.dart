import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../freezed/responses/cloud_response.dart';
/*
class EventItem extends StatelessWidget {
  final VideoEvent item;
  final Function(VideoEvent) onTap;
  const EventItem({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(item.timestamp);
    final timeFormatter = DateFormat('HH:mm:ss');
    final formattedTime = timeFormatter.format(dateTime);

    return GestureDetector(
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
            Text(
              item.meta.trigger_subtype,
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(0.8),
            ),
            Text(
              //item.meta.trigger,
              "sss",
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(0.8),
            ),
            Text(
              formattedTime,
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(0.8),
            ),
            Text(
              "${item.meta.navi.s} kph",
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(0.8),
            ),
          ]))),
    );
  }
}
*/
