import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

class OnlineService {
  Stream<OnlineStatus> statusChanged() {
    return Connectivity().onConnectivityChanged.asyncMap(
      (ConnectivityResult result) async {
        _logger.fine('connectivity change $result');
        final bool isMobileDataConnection = result == ConnectivityResult.mobile;
        bool isInternetConnected = result != ConnectivityResult.none;
        if (result != ConnectivityResult.none) {
          isInternetConnected = await InternetConnectionChecker().hasConnection;
        }

        return OnlineStatus(
          isInternetConnected: isInternetConnected || !_enabledFeature,
          isMobileDataConnection: isMobileDataConnection,
        );
      },
    ).debounceTime(Duration(milliseconds: 400));
  }

  Future<bool> isInternetConnected() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    bool isInternetConnected = result != ConnectivityResult.none;
    if (result != ConnectivityResult.none) {
      isInternetConnected = await InternetConnectionChecker().hasConnection;
    }
    return isInternetConnected || !_enabledFeature;
  }
}

const bool _enabledFeature = true;

class OnlineStatus {
  OnlineStatus({
    required this.isInternetConnected,
    required this.isMobileDataConnection,
  });

  final bool isInternetConnected;
  final bool isMobileDataConnection;
}

typedef OnlineCallback = void Function(
    {required bool isInternetConnected, required bool isMobileDataConnection});

// ignore: unused_element
final Logger _logger = Logger('OnlineService');
