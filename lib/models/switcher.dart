import 'package:flutter/material.dart';

class Switcher extends ChangeNotifier{
  bool isHome=false;

 bool getValue(){
    return isHome;
  }
  upDate(){
    isHome = true;
    notifyListeners();
  }

}