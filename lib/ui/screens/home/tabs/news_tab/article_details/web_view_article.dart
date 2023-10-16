import 'package:flutter/material.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview extends StatelessWidget {
  final String url;
  const webview({super.key , required this.url });

  @override
  Widget build(BuildContext context){
    print("url is :${url}");
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    initialUrl: url,
                  javascriptMode: JavascriptMode.unrestricted,
                  backgroundColor: AppColors.white,
                ),
            ),
          ],
        ));
  }
}
