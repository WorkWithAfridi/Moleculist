import 'package:flutter/material.dart';

Color getHazardColor(String hazard) {
  switch (hazard.toLowerCase()) {
    case 'flammable':
      return Colors.red;
    case 'toxic':
      return Colors.purple;
    case 'corrosive':
      return Colors.blueGrey;
    default:
      return Colors.orange;
  }
}
