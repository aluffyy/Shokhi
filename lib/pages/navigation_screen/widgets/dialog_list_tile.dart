import 'package:flutter/material.dart';

class DialogListTile extends StatelessWidget {
  final String text;
  final Icon icon;
  final void Function() onPressed;

  const DialogListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: ListTile(
        leading: icon,
        title: Text(text),
      ),
    );
  }
}
