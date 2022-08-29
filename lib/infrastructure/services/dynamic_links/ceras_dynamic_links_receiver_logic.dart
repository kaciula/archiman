import 'package:archiman/app/app_navigator.dart';
import 'package:logging/logging.dart';

import 'dynamic_links_service.dart';

class CerasDynamicLinksReceiverLogic extends DynamicLinksReceiverLogic {
  CerasDynamicLinksReceiverLogic(this.appNavigator);

  final AppNavigator appNavigator;

  @override
  Future<void> callback(Uri deepLink) async {
    // Uri? pendingDeepLink;

    _logger.fine('Dynamic links logic [$deepLink]');

    // TODO: parse deepLink and decide where to go

    // pendingDeepLink = null;
  }
}

// ignore: unused_element
final Logger _logger = Logger('CerasDynamicLinksReceiverLogic');
