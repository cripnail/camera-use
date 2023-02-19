import 'package:flutter/material.dart';

class CameraProvider with ChangeNotifier {
  int _index = 0;
  List<String> pictures = [];

  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }
}
