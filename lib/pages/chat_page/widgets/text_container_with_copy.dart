import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TextContainerWithCopy extends StatelessWidget {
  final bool isFromUser;
  final String text;

  const TextContainerWithCopy(
      {super.key, required this.isFromUser, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Ensures content fits
      children: [
        if (isFromUser)
          IconButton(
            onPressed: () => Clipboard.setData(ClipboardData(text: text)),
            icon: const Icon(Icons.content_copy),
            iconSize: 18.0,
            color: Colors.grey, // Adjust color as needed
          ),
        Container(
          constraints: const BoxConstraints(maxWidth: 320),
          decoration: BoxDecoration(
            color: isFromUser
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          margin: const EdgeInsets.only(bottom: 8),
          child: MarkdownBody(
            selectable: true,
            data: text,
          ),
        ),
        if (!isFromUser)
          IconButton(
            onPressed: () => Clipboard.setData(ClipboardData(text: text)),
            icon: const Icon(Icons.content_copy),
            iconSize: 18.0,
            color: Colors.grey, // Adjust color as needed
          ),
      ],
    );
  }
}
