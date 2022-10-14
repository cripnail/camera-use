import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ImagesView extends StatefulWidget {
  const ImagesView({Key? key}) : super(key: key);

  @override
  State<ImagesView> createState() => _ImagesViewState();
}

@override
class _ImagesViewState extends State<ImagesView> {
  XFile? lastImage;

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    if (lastImage != null) {
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0)),
            width: 120,
            height: 240,
            child: Image.file(
              File(lastImage!.path),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
