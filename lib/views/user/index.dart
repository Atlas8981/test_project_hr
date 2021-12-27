import 'package:flutter/material.dart';
import 'package:test_project_hr/components/main_screen.dart';
import 'package:test_project_hr/components/text_display/text_tile.dart';


class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final List<Item> _data = [
    Item(expandedValue: '', headerValue: 'ព័ត៌មានផ្ទាល់ខ្លួន'),
    Item(expandedValue: '', headerValue: 'ព័ត៌មានគ្រួសារ'),
    Item(expandedValue: '', headerValue: 'ប្រវត្តិការងារ'),
    Item(expandedValue: '', headerValue: 'ប្រវត្តិការសិក្សា'),
    Item(expandedValue: '', headerValue: 'ភាសា'),
    Item(expandedValue: '', headerValue: 'កាំបៀវត្ស'),
    Item(expandedValue: '', headerValue: 'ឥស្សរិយយស្ស'),
  ];

  @override
  Widget build(BuildContext context) {
    return MyMainScreen(
      rootLevel: false,
      title: 'ព័តមានផ្ទាល់ខ្លួន',
      body: ListView(
        children: [
          Container(
            height: 104,
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage:
                      AssetImage('assets/Avatar/image/Image@3x.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'មុត ប៉េងឈង',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'មន្រ្តីបច្ចេកទេសជាន់ខ្ពស់',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
          ),
          _buildPanel()
        ],
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      elevation: 0,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item.headerValue,
                style: const TextStyle(fontSize: 20),
              ),
            );
          },
          body: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 10, 10),
            child: Column(
              children: const [
                MyTextTile(label: 'គោត្តនាម និង នាម', value: 'មុត ប៉េងឈង'),
                Divider(),
                MyTextTile(label: 'ភេទ', value: 'ប្រុស'),
                Divider(),
                MyTextTile(label: 'ថ្ងៃ​ ខែ ឆ្នាំ កំណើត', value: '០៦/០៦/១៩៩៧'),
                Divider(),
                MyTextTile(label: 'ជនជាតិ', value: 'ខ្មែរ'),
                Divider(),
                MyTextTile(label: 'សញ្ជាតិ', value: 'ខ្មែរ'),
                Divider(),
                MyTextTile(
                  label: 'ទីកន្លែងកំណើត',
                  value: 'គីរីចុងកោះ គីរីវង់ តាកែវ',
                ),
                Divider(),
                MyTextTile(label: 'ស្ថានភាពគ្រួសារ', value: 'នៅលីវ'),
                Divider(),
                MyTextTile(
                    label: 'អាស័យដ្ឋានបច្ចុប្បន្ន',
                    value: 'ព្រែកតានូ ២ ចាក់អង្រែលើ មានជ័យ ភ្នំពេញ'),
                Divider(),
                MyTextTile(label: 'លេខទូរស័ព្ទ', value: '០៩៣ ៥៣៣ ០៧០'),
                Divider(),
                MyTextTile(label: 'អត្តលេខ', value: '១៩៧២១០០០៨៦'),
                Divider(),
                MyTextTile(label: 'ថ្ងៃបម្រើការងារ', value: '០១/០៦/២០២០'),
                Divider(),
                MyTextTile(label: 'ថ្ងៃតាំងស៊ប់', value: '០១/០៦/២០២១'),
              ],
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  final String expandedValue;
  final String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
