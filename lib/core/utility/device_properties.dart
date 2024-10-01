import 'package:flutter/material.dart';

class DeviceProperties {
  final BuildContext context;

  const DeviceProperties({required this.context});

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
}
