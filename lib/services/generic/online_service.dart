import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

class OnlineService {
  late OnlineStatus _status;
  StreamSubscription<OnlineStatus>? _sub;

  bool get isInternetConnected => _status.isInternetConnected;

  Future<void> init() async {
    _status = OnlineStatus(
      isInternetConnected: true,
      isMobileDataConnection: false,
    );

    final ConnectivityResult result = await Connectivity().checkConnectivity();
    _status = await _buildStatus(result);

    _sub = statusChanged().listen((OnlineStatus status) {
      _status = status;
    });
  }

  void dispose() {
    _sub?.cancel();
  }

  Stream<OnlineStatus> statusChanged() {
    return Connectivity().onConnectivityChanged.asyncMap(
      (ConnectivityResult result) {
        _logger.fine('connectivity change $result');
        return _buildStatus(result);
      },
    ).debounceTime(Duration(milliseconds: 400));
  }

  Future<OnlineStatus> _buildStatus(ConnectivityResult result) async {
    final bool isMobileDataConnection = result == ConnectivityResult.mobile;
    bool isInternetConnected = result != ConnectivityResult.none;
    if (result != ConnectivityResult.none) {
      isInternetConnected = await InternetConnectionChecker().hasConnection;
    }

    return OnlineStatus(
      isInternetConnected: isInternetConnected,
      isMobileDataConnection: isMobileDataConnection,
    );
  }

  Future<bool> isInternetConnectedNow() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    final OnlineStatus status = await _buildStatus(result);
    _status = status;
    return status.isInternetConnected;
  }
}

class OnlineStatus {
  OnlineStatus({
    required this.isInternetConnected,
    required this.isMobileDataConnection,
  });

  final bool isInternetConnected;
  final bool isMobileDataConnection;
}

// ignore: unused_element
final Logger _logger = Logger('OnlineService');
