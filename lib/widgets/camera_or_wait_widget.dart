import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraOrWaitWidget extends StatelessWidget {
  const CameraOrWaitWidget({
    super.key,
    required this.controller,
  });

  final CameraController? controller;

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return const Text(
        'Loading...',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: CameraPreview(controller!),
      );
    }
  }
}
