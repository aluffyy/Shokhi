import 'package:flutter/material.dart';
import 'package:shokhi/pages/chat_page/widgets/text_container_with_copy.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isFromUser;

  const MessageWidget({
    super.key,
    required this.text,
    required this.isFromUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        // Use the custom TextContainerWithCopy widget
        TextContainerWithCopy(isFromUser: isFromUser, text: text),
      ],
    );
  }
}
