import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:shokhi/pages/chat_page/widgets/custom_loading_animation.dart';
import 'package:shokhi/pages/chat_page/widgets/message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final model = GenerativeModel(
    model: "gemini-pro",
    apiKey: dotenv.env['API_KEY']!,
  );
  late final ChatSession chat;

  late TextEditingController textController;
  late ScrollController scrollController;

  bool loading = false;

  @override
  void initState() {
    super.initState();

    chat = model.startChat();
    textController = TextEditingController();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    textController.dispose();
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool hasApiKey =
        dotenv.env['API_KEY'] != null && dotenv.env['API_KEY']!.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: hasApiKey
                ? ListView.builder(
                    controller: scrollController,
                    itemBuilder: (context, idx) {
                      final content = chat.history.toList()[idx];
                      final text = content.parts
                          .whereType<TextPart>()
                          .map<String>((e) => e.text)
                          .join('');
                      return MessageWidget(
                        text: text,
                        isFromUser: content.role == 'user',
                      );
                    },
                    itemCount: chat.history.length,
                  )
                : ListView(
                    children: const [
                      Text('No API key found. Please provide an API Key.'),
                    ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 9,
              horizontal: 9,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(11),
                      hintText: 'Ask shokhi anything...',
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(14),
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(14),
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    onFieldSubmitted: (String value) {
                      _sendChatMessage(value);
                    },
                  ),
                ),
                const SizedBox.square(
                  dimension: 15,
                ),
                loading
                    ? const CustomLoadingAnimation()
                    : IconButton(
                        onPressed: () async {
                          _sendChatMessage(textController.text);
                        },
                        icon: Icon(
                          Icons.send,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() => loading = true);

    try {
      final response = await chat.sendMessage(Content.text(message));
      final text = response.text;
      if (text == null) {
        debugPrint('No response from API.');
        return;
      }
      setState(() => loading = false);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      textController.clear();
      setState(() => loading = false);
    }
  }
}
