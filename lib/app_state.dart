import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _rotationNumber = 0.0;
  double get rotationNumber => _rotationNumber;
  set rotationNumber(double value) {
    _rotationNumber = value;
  }

  String _sessionId = '';
  String get sessionId => _sessionId;
  set sessionId(String value) {
    _sessionId = value;
  }

  int _spinningId = 0;
  int get spinningId => _spinningId;
  set spinningId(int value) {
    _spinningId = value;
  }

  bool _hasCuppon = false;
  bool get hasCuppon => _hasCuppon;
  set hasCuppon(bool value) {
    _hasCuppon = value;
  }
}
