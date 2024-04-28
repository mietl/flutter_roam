import 'package:flutter/material.dart';
import 'package:flutter_roam/api/api_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RoamBrowser extends StatefulWidget {
  const RoamBrowser({super.key, required this.url,this.title });

  final Uri url;
  final String? title;

  @override
  State<RoamBrowser> createState() => _RoamBrowserState();
}

class _RoamBrowserState extends State<RoamBrowser> {
  double progressBarValue = 0;
  GlobalKey progressBarKey = GlobalKey();

  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setUserAgent(ApiConstants.userAgent);

  @override
  void initState() {
    super.initState();
    controller.setNavigationDelegate(
        NavigationDelegate(
            onProgress: (progress){
              if(progressBarKey.currentState?.mounted ?? false){
                  progressBarKey.currentState?.setState(() {
                    progressBarValue = progress / 100.toDouble();
                  });
              }
            }
         )
    );
    controller.loadRequest(widget.url);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Column(
        children: [
          // 顶部加载进度条
          StatefulBuilder(
              key: progressBarKey,
             builder:(context,setState){
               return Visibility(
                  visible: progressBarValue < 1,
                   child:LinearProgressIndicator(
                     key: ValueKey(progressBarValue),
                     value: progressBarValue,
                   )
               );
             }
          ),
          // Expanded(child: WebViewWidget(
          //   controller: controller,
          // ))
        ],
      ),
    );
  }
}
