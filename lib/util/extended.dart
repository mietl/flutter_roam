import 'package:flutter/material.dart';

import 'screen_kit.dart';

extension ContextExtended on BuildContext {
  void showMessage(String message,
      {Duration duration = const Duration(milliseconds: 2000)}) {
    if (mounted) {
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: duration,
        ),
      );
    }
  }

  void push(Widget target) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => target));
  }

  void replace(Widget target){
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (context) => target));
  }

  void pop() {
    Navigator.pop(this);
  }
}


extension screenValue on num{
  double get px=> ScreenKit.px * this;
  double get rpx=> ScreenKit.rpx * this;
}
