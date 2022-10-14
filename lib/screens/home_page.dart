import 'package:flutter/cupertino.dart';

import '../nav.dart';
import 'camera_view.dart';
import 'images_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Map<String, dynamic>> tabBar = [
    {'title': 'Camera', 'icon': CupertinoIcons.camera},
    {'title': 'Images', 'icon': CupertinoIcons.bolt_badge_a},
  ];

  late List<Nav> _nav;

  @override
  void initState() {
    super.initState();
    _nav = tabBar.map((item) => Nav.fromMap(item)).toList();
    // unwaited(initCamera());
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _nav.map((item) {
          return BottomNavigationBarItem(
            // ignore: deprecated_member_use
            label: item.title,
            icon: Icon(item.icon),
          );
        }).toList(),
      ),
      // ignore: missing_return
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return const CameraView();
            break;
          case 1:
            return const ImagesView();
            break;
          default:
        }
      },
    );
  }
}
