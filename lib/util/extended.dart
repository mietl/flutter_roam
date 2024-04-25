import 'package:flutter/material.dart';
import 'package:flutter_roam/pages/webview/index.dart';
import 'package:get/get.dart';

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

  void openUrl({String? url,String? title}){
    if(url==null) return;
    Navigator.push(this,
        MaterialPageRoute(builder: (context){
          return RoamBrowser(url: Uri.parse(url),title: title??'');
        })
    );
  }
}


extension ScreenValue on num{
  double get px=> ScreenKit.px * this;
  double get rpx=> ScreenKit.rpx * this;
}


 void openUrl(String? url,{String? title}){
    if(url==null) return;
    
     var tryUrl = Uri.tryParse(url);
     if(tryUrl == null || tryUrl.hasScheme){
      return;
     }

    Get.to(RoamBrowser(url: tryUrl));
  }