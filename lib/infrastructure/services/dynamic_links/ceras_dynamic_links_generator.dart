import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:logging/logging.dart';

class CerasDynamicLinksGenerator {
  CerasDynamicLinksGenerator();

  Future<String> generateSharePostLink({required String postId}) async {
    final String link = '$_link?$queryParamPostId=$postId';

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: _dynamicLinkPrefix,
      link: Uri.parse(link),
      androidParameters: AndroidParameters(
        packageName: _androidAppId,
        minimumVersion: 1,
      ),
      iosParameters: IOSParameters(
        bundleId: _iOSBundleId,
        minimumVersion: '0.0.1',
        appStoreId: _appStoreId,
      ),
    );

    final ShortDynamicLink shortLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    return shortLink.shortUrl.toString();
  }
}

// FIXME: Use app's values
const String _dynamicLinkPrefix = 'https://cerashealthv2.page.link';
const String _link = 'https://myceras.com';
const String queryParamPostId = 'post_id';
const String _androidAppId = 'com.cerashealth.imhomev2';
const String _iOSBundleId = 'com.cerashealth.imhomev2';
const String _appStoreId = '1590781672';

// ignore: unused_element
final Logger _logger = Logger('CerasDynamicLinksGenerator');
