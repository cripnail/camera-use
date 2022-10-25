// import 'package:camera/camera.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// class CameraView extends StatefulWidget {
//   const CameraView({Key? key}) : super(key: key);
//
//   @override
//   State<CameraView> createState() => _CameraViewState();
// }
//
// @override
// class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
//   late List<CameraDescription> cameras;
//   CameraController? controller;
//   XFile? lastImage;
//
//   @override
//   void initState() {
//     super.initState();
//     initCamera();
//     // unwaited(initCamera());
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final CameraController? cameraController = controller;
//     if (cameraController == null || cameraController.value.isInitialized) {
//       return;
//     }
//     if (state == AppLifecycleState.inactive) {
//       cameraController.dispose();
//     } else if (state == AppLifecycleState.resumed) {
//       _onNewCameraSelected(cameraController.description);
//     }
//   }
//
//   Future<void> initCamera() async {
//     cameras = await availableCameras();
//     controller = CameraController(cameras[0], ResolutionPreset.max);
//     await controller?.initialize();
//     setState() {}
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           controller?.value.isInitialized == true
//               ? Center(child: CameraPreview(controller!))
//               : const SizedBox(),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: IconButton(
//               iconSize: 48.0,
//               onPressed: () async {
//                 lastImage = await controller?.takePicture();
//                 setState() {}
//               },
//               icon: const Icon(Icons.camera),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   void _onNewCameraSelected(CameraDescription cameraDescription) async {
//     if (controller != null) {
//       await controller!.dispose();
//     }
//     final CameraController cameraController = CameraController(
//         cameraDescription,
//         kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
//         enableAudio: true,
//         imageFormatGroup: ImageFormatGroup.jpeg);
//     controller = cameraController;
//     cameraController.addListener(() {
//       if (mounted) setState() {}
//     });
//   }
// }
