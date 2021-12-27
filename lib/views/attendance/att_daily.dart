import 'package:flutter/material.dart';
import 'package:test_project_hr/components/main_screen.dart';


class AttendanceDailyPage extends StatefulWidget {
  const AttendanceDailyPage({Key? key}) : super(key: key);

  @override
  _AttendanceDailyPageState createState() => _AttendanceDailyPageState();
}

class _AttendanceDailyPageState extends State<AttendanceDailyPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tiles = [
      ListTile(
        title: const Text('ព្រឹក / ចូល'),
        subtitle: const Text('ទាន់ពេល / ម៉ោង ០៨ៈ០០ នាទី'),
        selected: false,
        trailing: Checkbox(
          value: true,
          onChanged: (bool? value) {

          },
          activeColor: theme.colorScheme.primary,
        ),
      ),
      ListTile(
        title: const Text('ព្រឹក / ចេញ'),
        subtitle: const Text('ទាន់ពេល / ម៉ោង ១២ៈ០០ នាទី'),
        selected: false,
        trailing: Checkbox(
          value: true,
          onChanged: (bool? value) {},
          activeColor: theme.colorScheme.primary,
        ),
      ),
      ListTile(
        title: const Text('ល្ងាច / ចូល'),
        subtitle: const Text('ទាន់ពេល / ម៉ោង ០២ៈ០០ នាទី'),
        selected: false,
        trailing: Checkbox(
          value: true,
          onChanged: (bool? value) {},
          activeColor: theme.colorScheme.primary,
        ),
      ),
      ListTile(
        title: const Text('ល្ងាច / ចេញ'),
        subtitle: const Text('ទាន់ពេល / ម៉ោង ០៥ៈ០០ នាទី'),
        selected: false,
        trailing: Checkbox(
          value: true,
          onChanged: (bool? value) {},
          activeColor: theme.colorScheme.primary,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Container(
          decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(100)),
          padding: const EdgeInsets.all(6),
          child: Row(
            children: const [
              Icon(
                Icons.check,
                color: Colors.white,
              ),
              SizedBox(width: 6),
              Text(
                'ជោគជ័យ',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      )
    ];
    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
      color: theme.colorScheme.primary,
    ).toList();
    return MyMainScreen(
      rootLevel: false,
      title: 'វត្តមានផ្ទាល់ខ្លួន',
      body: ListView(
        children: divided,
      ),
    );
  }
}
