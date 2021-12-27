import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final Widget title;

  final List<Widget> content;

  final List<Widget> actionList;

  const MyAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.actionList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: SingleChildScrollView(
        child: ListBody(
          children: content,
        ),
      ),
      actions: actionList,
    );
  }
}
