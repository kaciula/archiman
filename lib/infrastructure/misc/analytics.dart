import 'package:archiman/app/app_constants.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class Analytics {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  List<NavigatorObserver> navigatorObservers() {
    return isProduction
        ? <NavigatorObserver>[
            FirebaseAnalyticsObserver(analytics: _analytics),
          ]
        : [];
  }
}

// ignore: unused_element
final Logger _logger = Logger('Analytics');
