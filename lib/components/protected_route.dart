import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:test_project_hr/components/custom_alert_dialog.dart';
import 'package:test_project_hr/providers/authentication_provider.dart';
import 'package:test_project_hr/services/location_service.dart';
import 'package:test_project_hr/views/authentication/index.dart';

class ProtectedRoute extends StatelessWidget {
  final Widget child;

  ProtectedRoute({
    Key? key,
    required this.child,
  }) : super(key: key);

  Future<void> checkLocation(context) async {
    final status = await Permission.locationWhenInUse.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      SystemNavigator.pop();
    }

    final isEnable = await Permission.locationWhenInUse.serviceStatus.isEnabled;
    if (!isEnable) {
      showCustomDialog(
        context,
        title: "Please Turn On Your Location",
        confirmText: "OK",
        onConfirm: () async {
          await Geolocator.openLocationSettings();
          final turnOnLocation =
              await Permission.locationWhenInUse.serviceStatus.isEnabled;
          if (!turnOnLocation) {
            Get.back();
          }
        },
        cancelText: "Cancel",
        onCancel: () {
          SystemNavigator.pop();
        },
      );

      // Get.defaultDialog(
      //   title: "Please Turn On Your Location",
      //   // content: const Text("Press OK to go to setting"),
      //   textCancel: "Cancel",
      //   onCancel: () {
      //     Get.back();
      //   },
      //   textConfirm: "OK",
      //   onConfirm: () async {
      //
      //   },
      // );

    }
  }

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    checkLocationService().onError((error, stackTrace) => SystemNavigator.pop());
    final auth = Provider.of<AuthenticationProvider>(context);
    if (auth.getToken == null) {
      return const AuthenticationPage();
    }
    return child;
    // return Scaffold(
    //   appBar: AppBar(
    //
    //   ),
    // );
  }
}
