import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class AnalyticsService {
  List<NavigatorObserver> navigatorObservers() {
    return kReleaseMode
        ? <NavigatorObserver>[
            FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
          ]
        : [];
  }
}

// ignore: unused_element
final Logger _logger = Logger('Analytics');
