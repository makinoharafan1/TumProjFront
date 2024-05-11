import 'package:flutter/material.dart';
import 'package:puble_frontend/models/pr_model.dart';

import 'package:puble_frontend/screens/pr/components/pr_app_bar.dart';
import 'package:puble_frontend/screens/pr/components/web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';


class PRScreen extends StatelessWidget {
  
  final PullRequestModel pr;
  
  const PRScreen({
    super.key,
    required this.pr,
  });

  //WebViewController controller = WebViewController()..loadRequest(Uri.parse("https://github.com/Aleshua/OMSTU-lubs5/pull/11"));

  // void initState() {
  //   controller = WebViewController()
  //     ..loadRequest(
  //       Uri.parse(pr.prLink),
  //     );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewApp(pr: pr,),
    );
  }
}