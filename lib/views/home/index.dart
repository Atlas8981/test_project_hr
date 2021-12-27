import 'package:flutter/material.dart';
import 'package:test_project_hr/components/main_screen.dart';
import 'package:test_project_hr/components/tile_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyMainScreen(
      rootLevel: true,
      title: 'ប្រព័ន្ធព័ត៌មានមន្រ្ដីរាជការ',
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          primary: false,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: [
            MyTileButton(
              onPressAction: () =>
                  Navigator.pushNamed(context, '/attendance/scan'),
              label: 'ស្កេនវត្តមាន',
              iconPath: 'assets/icons/outlined/att-scanner-icon.png',
            ),
            MyTileButton(
              onPressAction: () =>
                  Navigator.pushNamed(context, '/attendance/daily'),
              label: 'វត្តមានផ្ទាល់ខ្លួន',
              iconPath: 'assets/icons/outlined/att-daily-icon.png',
            ),
            MyTileButton(
              onPressAction: () =>
                  Navigator.pushNamed(context, '/user-profile'),
              label: 'ព័ត៌មានផ្ទាល់ខ្លួន',
              iconPath: 'assets/icons/outlined/user-detail-icon.png',
            ),
          ],
        ),
      ),
    );
  }
}
