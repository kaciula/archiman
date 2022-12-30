import 'package:app_links/app_links.dart';
import 'package:logging/logging.dart';

class AppLinksService {
  final AppLinks _appLinks = AppLinks();

  Future<void> initReceiver(AppLinksReceiverLogic receiverLogic) async {
    final Uri? deepLink = await _appLinks.getInitialAppLink();
    if (deepLink != null) {
      _logger.fine('Got an initial link $deepLink');
      receiverLogic.callback(deepLink);
    }

    _appLinks.uriLinkStream.listen(
      (Uri deepLink) {
        _logger.fine('App link success callback with link $deepLink');
        receiverLogic.callback(deepLink);
      },
      onError: (Object error) async {
        _logger.fine('onLinkError $error');
      },
    );
  }
}

abstract class AppLinksReceiverLogic {
  Future<void> callback(Uri deepLink);
}

// ignore: unused_element
final Logger _logger = Logger('AppLinksService');
