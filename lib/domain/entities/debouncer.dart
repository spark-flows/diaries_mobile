import 'dart:async';

import 'package:flutter/material.dart';

/// Class to call the api after specific amount of time
class Debouncer {
  VoidCallback? action;
  Timer? _timer;

  void run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(const Duration(milliseconds: 750), action);
  }
}
