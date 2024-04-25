import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_roam/api/login_api.dart';
import 'package:flutter_roam/pages/login_page.dart';
import 'package:flutter_roam/pages/roam_page.dart';
import 'package:flutter_roam/util/preferences.dart';
import 'package:flutter_roam/util/screen_kit.dart';
import 'package:flutter_roam/util/string.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  //状态栏、导航栏沉浸
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFff9380)),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: PreferencesUtil.init(),
        builder: (BuildContext context,snapshot){
          ScreenKit.init(context);
          if(snapshot.connectionState != ConnectionState.done){
              return const Scaffold(
                body: Center(child: CircularProgressIndicator())
              );
          }else{
             var token = LoginApi.getToken();
             if(isEmpty(token)){
                return const LoginPage();
             }else{
                return const RoamPage();
             }
          }
        }
      ),
    );
  }
}

