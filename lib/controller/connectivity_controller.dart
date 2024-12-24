import 'dart:async';
import 'dart:io';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utility/api_provider.dart';
import '../utility/locator.dart';

class ConnectivityController extends ChangeNotifier {
  final BuildContext buildContext;
  final ApiProvider apiProvider = locator<ApiProvider>();
  final Connectivity _connectivity = Connectivity();

  ConnectivityController(this.buildContext);

  bool _isOnline = true;
  bool get isOnline => _isOnline;

  startMonitoring() async {
    await initConnectivity();
    _connectivity.onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else {
        await _updateConnectionStatus().then((bool isConnected) {
          _isOnline = isConnected;
          notifyListeners();
        });
      }
    } as void Function(List<ConnectivityResult> event)?);
  }

  Future<void> initConnectivity() async {
    try {
      var status = await _connectivity.checkConnectivity();

      if (status == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else {
        _isOnline = true;
        notifyListeners();
      }
    } on PlatformException catch (e) {
      log("PlatformException: $e");
    }
  }

  Future<bool> _updateConnectionStatus() async {
    try {
      final List<InternetAddress> result =
      await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true; //connected
      } else {
        return false; //not connected
      }
    } on SocketException catch (_) {
      return false; //not connected
      //return false;
    }
  }
}
