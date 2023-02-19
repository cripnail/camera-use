import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:media/widgets/camera_preview_widget.dart';
import 'package:provider/provider.dart';

import 'provider/camera_provider.dart';

class CameraAppWidget extends StatefulWidget {
  const CameraAppWidget({super.key});

  @override
  _CameraAppWidgetState createState() => _CameraAppWidgetState();
}

class _CameraAppWidgetState extends State<CameraAppWidget> {
  CameraController? controller;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    availableCameras().then((value) {
      cameras = value;
      controller = CameraController(cameras[0], ResolutionPreset.medium);
      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cameraProvider = Provider.of<CameraProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera App'),
      ),
      body: Center(
        child: CameraPreviewWidget(
            context: context, controller: controller, mounted: mounted),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cameraProvider.index,
        onTap: (index) {
          cameraProvider.index = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
        ],
      ),
    );
  }
}
