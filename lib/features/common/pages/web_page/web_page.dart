import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatelessWidget {
  const WebPage({
    Key? key,
    required this.title,
    this.url,
    this.html,
  })  : assert(url != null || html != null),
        super(key: key);

  static const String routeName = 'webPage';

  final String title;
  final String? url;
  final String? html;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl:
            url ?? Uri.dataFromString(html!, mimeType: 'text/html').toString(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class WebPageArgs {
  WebPageArgs({required this.title, this.url, this.html})
      : assert(url != null || html != null);

  final String title;
  String? url;
  String? html;
}
