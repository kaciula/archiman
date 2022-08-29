import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:logging/logging.dart';

class DynamicLinksService {
  bool processing = false;

  Future<void> initReceiver(DynamicLinksReceiverLogic receiverLogic) async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      _logger.fine('Got an initial link. Path=$deepLink');
      receiverLogic.callback(deepLink);
    }

    FirebaseDynamicLinks.instance.onLink.listen(
      (PendingDynamicLinkData? dynamicLink) async {
        _logger.fine('Dynamic link success callback with link $dynamicLink');
        final Uri? deepLink = dynamicLink?.link;
        if (deepLink != null) {
          // The method is called twice so we need to have a safeguard here
          if (!processing) {
            _logger.fine('Listener triggered. Path=$deepLink');
            processing = true;
            receiverLogic.callback(deepLink);
            processing = false;
          }
        }
      },
      onError: (Object error) async {
        _logger.fine('onLinkError $error');
      },
    );
  }
}

abstract class DynamicLinksReceiverLogic {
  Future<void> callback(Uri deepLink);
}

// ignore: unused_element
final Logger _logger = Logger('DynamicLinks');
