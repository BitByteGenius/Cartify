import 'dart:async';

import 'package:cartify/common/widgets/login_singup/loaders/loader.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<List<ConnectivityResult>> _streamSubscription;

 final RxList<ConnectivityResult> _connectionStatus =
    <ConnectivityResult>[].obs;
    
  @override
  void onInit() {
    super.onInit();

    _streamSubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  /// Update connection status
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus.value = result;

    if (result.contains(ConnectivityResult.none)) {
      TLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  /// Check internet connection manually
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();

      if (result.contains(ConnectivityResult.none)) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  /// Dispose stream
  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }
}