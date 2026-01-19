import 'package:connectivity_plus/connectivity_plus.dart';


class InternetService {
  final Connectivity _connectivity = Connectivity();

  Future<bool> hasInternet() async {
    final results = await _connectivity.checkConnectivity();
    return _isConnected(results);
  }

  bool _isConnected(List<ConnectivityResult> results) {
    return results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.ethernet) ||
        results.contains(ConnectivityResult.wifi);
  }

  Stream<bool> get onStatusChange {
    return _connectivity.onConnectivityChanged.map(_isConnected);
  }
}
