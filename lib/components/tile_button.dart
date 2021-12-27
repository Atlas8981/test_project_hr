import 'package:flutter/material.dart';

class MyTileButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final Function() onPressAction;

  const MyTileButton({
    Key? key,
    required this.onPressAction,
    required this.label,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: MaterialButton(
        onPressed: onPressAction,
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(iconPath),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(3),
                      bottomRight: Radius.circular(3),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
