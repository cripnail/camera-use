
import 'package:flutter/material.dart';
import 'package:media/provider/camera_provider.dart';
import 'package:provider/provider.dart';

import 'camera_app_widget.dart';

class CameraApp extends StatelessWidget {
  const CameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CameraProvider(),
      child: CameraAppWidget(),
    );
  }
}