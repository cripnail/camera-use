import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/camera_provider.dart';
import 'camera_or_wait_widget.dart';

class CameraPreviewWidget extends StatelessWidget {
  const CameraPreviewWidget({
    super.key,
    required this.context,
    required this.controller,
    required this.mounted,
  });

  final BuildContext context;
  final CameraController? controller;
  final bool mounted;

  @override
  Widget build(BuildContext context) {
    final cameraProvider = Provider.of<CameraProvider>(context);
    if (cameraProvider.index == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CameraOrWaitWidget(controller: controller),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text(
                  'Take Picture',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                onPressed: () {
                  controller!.takePicture().then((XFile filePath) {
                    if (mounted) {
                      cameraProvider.pictures.add(filePath.path);
                    }
                  });
                },
              )
            ],
          )
        ],
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        children: List.generate(cameraProvider.pictures.length, (index) {
          return Image.file(
            File(cameraProvider.pictures[index]),
            fit: BoxFit.cover,
          );
        }),
      );
    }
  }
}