import 'package:flutter/material.dart';

class MyTextTile extends StatelessWidget {
  final String label;
  final String value;

  const MyTextTile({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(label),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
