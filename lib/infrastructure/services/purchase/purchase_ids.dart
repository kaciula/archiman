import 'package:kt_dart/kt.dart';

// FIXME: Put valid product ids here
class PurchaseIds {
  PurchaseIds._();

  // Android old
  static const String subscriptionPremiumAndroid = 'com.feis.premium';
  static const String subscriptionPremiumPlusAndroid = 'com.feis.premium_plus';
  static const String purchaseSingleTrackAndroid = 'com.feis.singletrack';
  static const String purchaseStandardAndroid = 'com.feis.regular';

  // iOS old
  static const String subscriptionPremiumIOS = 'com.feis.premium';
  static const String subscriptionPremiumPlusIOS1 = 'com.feis.premium_yearly';
  static const String subscriptionPremiumPlusIOS2 = 'com.feis.premium_plus';
  static const String purchaseSingleTrackIOS1 = 'com.feis.singletrack';
  static const String purchaseSingleTrackIOS2 = 'com.feis.singletrack_new';
  static const String purchaseStandardIOS1 = 'com.feis.regular';
  static const String purchaseStandardIOS2 = 'com.feis.regular_new';

  static KtSet<String> allAndroid = KtSet.of(
    purchaseSingleTrackAndroid,
    purchaseStandardAndroid,
    subscriptionPremiumAndroid,
    subscriptionPremiumPlusAndroid,
  );

  static KtSet<String> allIOS = KtSet.of(
    purchaseSingleTrackIOS1,
    purchaseSingleTrackIOS2,
    purchaseStandardIOS1,
    purchaseStandardIOS2,
    subscriptionPremiumIOS,
    subscriptionPremiumPlusIOS1,
    subscriptionPremiumPlusIOS2,
  );
}
