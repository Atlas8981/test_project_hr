import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:test_project_hr/components/alert_dialog.dart';
import 'package:test_project_hr/components/main_screen.dart';
import 'package:test_project_hr/models/attendance.dart';
import 'package:test_project_hr/models/users.dart';
import 'package:test_project_hr/providers/authentication_provider.dart';
import 'package:test_project_hr/services/attendance_service.dart'
    as attendance_service;
import 'package:test_project_hr/services/location_service.dart'
    as location_service;

class AttendanceScannerPage extends StatefulWidget {
  const AttendanceScannerPage({Key? key}) : super(key: key);

  @override
  _AttendanceScannerPageState createState() => _AttendanceScannerPageState();
}

class _AttendanceScannerPageState extends State<AttendanceScannerPage> {
  late BuildContext mainContext;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // Position currentPosition;
  late Barcode result;
  late QRViewController controller;
  late UserProfile userProfile;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userProfile = Provider.of<AuthenticationProvider>(context).userProfile;
    mainContext = context;
    return MyMainScreen(
      rootLevel: false,
      title: 'ស្កេនវត្តមាន',
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    Position currentPosition = await location_service.determinePosition();
    // setState(() {
    //   currentPosition = position;
    // });
    controller.scannedDataStream.listen((scanData) async {
      controller.stopCamera();
      // if (currentPosition == null) {
      //   _showDialog(false, false, 'មិនស្គាល់ទីតាំង');
      // }
      if (!currentPosition.isMocked) {
        AttCheckInRequest request = AttCheckInRequest(
            qrCodeUid: scanData.code,
            staffId: userProfile.staffId,
            dob: "1983-01-16",
            longitude: currentPosition.latitude,
            latitude: currentPosition.longitude,
            deviceIdentifier: "xxxxxxxxxxxxxxxxxxxxxxx");
        var res = await attendance_service.checkIn(request);
        if (res != null) _showDialog(false, res.isInside!, res.message!);
      } else {
        _showDialog(true, false, '');
      }
    });
  }

  Future<void> _showDialog(bool isMock, bool success, String message) async {
    const Text failTitle = Text(
      'បរាជ័យ',
      style: TextStyle(
        color: Colors.red,
      ),
    );
    const Text successTitle = Text(
      'ជោគជ័យ',
      style: TextStyle(
        color: Colors.green,
      ),
    );
    List<Text> content = [];
    if (isMock) {
      content.addAll(
        [
          const Text('អ្នកបានប្រើប្រាស់កម្មវិធីក្លែងបន្លំទីតាំង'),
          const Text('សូមបិទកម្មវិធីនោះ បន្ទាប់មកព្យាយាមម្ដងទៀត'),
        ],
      );
    } else {
      content.add(Text(message));
    }
    return await showDialog(
      context: context,
      builder: (context) {
        return MyAlertDialog(
          title: isMock || !success ? failTitle : successTitle,
          content: content,
          actionList: [
            TextButton(
              onPressed: isMock
                  ? () {
                      controller.resumeCamera();
                      Navigator.pop(context);
                    }
                  : (success
                      ? () {
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                              mainContext, '/attendance/daily');
                        }
                      : () {
                          Navigator.pop(context);
                          controller.resumeCamera();
                        }),
              child: const Text('យល់ព្រម'),
            )
          ],
        );
      },
    );
  }
}
