import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:test_project_hr/components/custom_alert_dialog.dart';
import 'package:test_project_hr/views/attendance/index.dart';
import 'package:test_project_hr/views/authentication/index.dart';
import 'package:test_project_hr/views/home/index.dart';
import 'package:test_project_hr/views/user/index.dart';

import 'components/protected_route.dart';
import 'providers/authentication_provider.dart';
import 'services/location_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // checkLocation();
  }

  Future<void> checkLocation() async {
    final status = await Permission.locationWhenInUse.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MPTC Officials information system',
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
      ],
      initialBinding: Initi,
      theme: ThemeData(
        primaryColor: const Color(0xFF003D7C),
        accentColor: const Color(0xFF003D7C),
        // accentColor: Color(0xFFF07C08),
        fontFamily: 'Hanuman',
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 16),
        ),
        hintColor: Colors.grey[400],
        appBarTheme: const AppBarTheme(
          color: Color(0xFF003D7C),
          elevation: 0,
        ),
        colorScheme: const ColorScheme(
          primary: Color(0xFF003D7C),
          primaryVariant: Color(0xFF003D7C),
          secondary: Color(0xFFF07C08),
          secondaryVariant: Color(0xFFF07C08),
          background: Colors.white,
          brightness: Brightness.light,
          error: Colors.red,
          onBackground: Colors.white,
          onError: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          surface: Colors.white,
        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => ProtectedRoute(
              child: HomePage(),
            ),
        '/auth': (context) => const AuthenticationPage(),
        '/attendance/scan': (context) => ProtectedRoute(
              child: AttendancePage(),
            ),
        '/attendance/daily': (context) => ProtectedRoute(
              child: AttendancePage(),
            ),
        '/user-profile': (context) => ProtectedRoute(
              child: UserPage(),
            ),
      },
    );
  }
}
