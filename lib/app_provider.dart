import 'package:flutter/widgets.dart';

class AppProvider with ChangeNotifier {
  String _name = '';

  String get name => _name;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }
}
