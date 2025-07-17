import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  CustomLoader({super.key, this.color = Colors.white});

  Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 20, width: 20, child: Platform.isAndroid ? CircularProgressIndicator(color: color) : CupertinoActivityIndicator(color: color));
  }
}
