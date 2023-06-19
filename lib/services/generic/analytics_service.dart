import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class AnalyticsService {
  List<NavigatorObserver> navigatorObservers() {
    return _isEnabled
        ? <NavigatorObserver>[
            FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
          ]
        : [];
  }

  Future<void> logScreen(String screenName) async {
    if (_isEnabled) {
      await FirebaseAnalytics.instance.setCurrentScreen(
        screenName: screenName,
        screenClassOverride: 'Name of the app', // FIXME: Put app name here
      );
    }
  }
}

const bool _isEnabled = kReleaseMode;

// ignore: unused_element
final Logger _logger = Logger('Analytics');
