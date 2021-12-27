import 'package:flutter/material.dart';
import 'package:test_project_hr/components/main_screen.dart';

import 'att_daily.dart';
import 'att_scan.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)!.settings.name;

    switch (currentRoute) {
      case '/attendance/scan':
        return const AttendanceScannerPage();
      case '/attendance/daily':
        return const AttendanceDailyPage();
      default:
        return MyMainScreen(
          rootLevel: false,
          title: '',
          body: Container(),
        );
    }
  }
}
