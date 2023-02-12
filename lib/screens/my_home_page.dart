import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:media/screens/take_picture_screen.dart';
import 'dart:io';
import '../nav.dart';
import 'gallery_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  List<File> capturedImages = [];

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  void saveImage(File image) {
    capturedImages.add(image);
  }
  List<File> getImages() {
    return capturedImages;
  }
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Map<String, dynamic>> tabBar = [
    {'title': 'Camera', 'icon': CupertinoIcons.camera},
    {'title': 'Images', 'icon': CupertinoIcons.graph_square_fill},
  ];
  late CameraDescription camera;

  late List<Nav> _nav;

  get images => widget.getImages();
  // late final List<File> images;

  @override
  void initState() {
    super.initState();
    _nav = tabBar.map((item) => Nav.fromMap(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _nav.map((item) {
          return BottomNavigationBarItem(
            label: item.title,
            icon: Icon(item.icon),
          );
        }).toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return TakePictureScreen(title: widget.title);
          case 1:
            return GalleryScreen(images: images);
          default:
            return const Text('404 page not found');
        }
      },
    );
  }
}
