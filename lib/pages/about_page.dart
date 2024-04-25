import 'package:flutter/material.dart';
import 'package:flutter_roam/api/api_constants.dart';
import 'package:flutter_roam/pages/webview/index.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: RoamBrowser(url: Uri.parse(ApiConstants.testUrl),title: '我的',key: const ValueKey("roam:${ApiConstants.testUrl}")),
    );
  }

  @override
  bool get wantKeepAlive => false;
}

