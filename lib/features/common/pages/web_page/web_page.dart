import 'package:archiman/features/common/widgets/custom/atoms/circular_progress.dart';
import 'package:archiman/services/generic/launcher_service.dart';
import 'package:archiman/start/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({
    Key? key,
    required this.title,
    this.url,
    this.html,
    this.openLinksExternally = true,
  })  : assert(url != null || html != null),
        super(key: key);

  static const String routeName = 'webPage';

  final String title;
  final String? url;
  final String? html;
  final bool openLinksExternally;

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final LauncherService _launcherService = getIt<LauncherService>();

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: isLoading ? 0 : 1,
        children: [
          AnimatedOpacity(
            opacity: isLoading ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: Center(
              child: CircularProgress(),
            ),
          ),
          AnimatedOpacity(
            opacity: isLoading ? 0 : 1,
            duration: Duration(milliseconds: 200),
            child: WebView(
              initialUrl: widget.url ??
                  Uri.dataFromString(widget.html!, mimeType: 'text/html')
                      .toString(),
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (_) => setState(() {
                isLoading = false;
              }),
              navigationDelegate: (NavigationRequest navigationRequest) {
                final String nextUrl = navigationRequest.url;
                if (nextUrl == widget.url) {
                  return NavigationDecision.navigate;
                } else {
                  if (nextUrl.startsWith('mailto')) {
                    final String emailAddress = nextUrl.split(':')[1];
                    _launcherService.sendEmailTo(emailAddress);
                  } else if (nextUrl.startsWith('tel')) {
                    final String phoneNum = nextUrl.split(':')[1];
                    _launcherService.dial(phoneNum: phoneNum);
                  } else if (nextUrl.startsWith('http')) {
                    if (widget.openLinksExternally) {
                      _launcherService.openExternalUrl(nextUrl);
                    } else {
                      return NavigationDecision.navigate;
                    }
                  }
                  return NavigationDecision.prevent;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WebPageArgs {
  WebPageArgs({
    required this.title,
    this.url,
    this.html,
    this.openLinksExternally = true,
  }) : assert(url != null || html != null);

  final String title;
  String? url;
  String? html;
  final bool openLinksExternally;
}
