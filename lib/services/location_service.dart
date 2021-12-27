import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class CheckLocationService extends GetxController {}

Future<Position> determinePosition() async {
  await checkLocationService()
      .onError((error, stackTrace) => SystemNavigator.pop());
  return await Geolocator.getCurrentPosition();
}

Future<void> checkLocationService() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // return LocationServiceStatus.disable;
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    // return LocationServiceStatus.permissionDenied;
    return Future.error(
        'Location permissions are permantly denied, we cannot request permissions.');
  }

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      // return LocationServiceStatus.permissionDenied;
      return Future.error(
          'Location permissions are denied (actual value: $permission).');
    }
  }

  // return LocationServiceStatus.ok;
}

enum LocationServiceStatus {
  enable,
  disable,
  permissionDenied,
  permissionAllow,
  ok
}
