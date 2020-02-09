
import 'package:flutter/foundation.dart';

class ScreenChangeState with ChangeNotifier{
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value){
    _currentIndex = value;
    notifyListeners();
  }
}