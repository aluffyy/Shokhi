import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shokhi/pages/chat_page/chat_page.dart';
import 'package:shokhi/pages/navigation_screen/widgets/account_dialog.dart';
import 'package:shokhi/provider/theme_provider.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shokhi",
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 20.0, // Remove shadow
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme(context);
            },
            icon: isDarkMode
                ? const Icon(Icons.dark_mode_rounded)
                : const Icon(Icons.light_mode_rounded),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const AccountDialog(),
              );
            },
            icon: const Icon(Icons.account_circle_rounded),
          ),
          // A little bit of spacing to the right
          const SizedBox(width: 10),
        ],
      ),
      // drawer: Drawer(
      //   child: SafeArea(
      //     child: Column(
      //       children: [
      //         const UserAccountsDrawerHeader(
      //           currentAccountPicture: CircleAvatar(
      //             backgroundColor: Colors.grey,
      //             child: Text("S"), // Replace with user image or initials
      //           ),
      //           accountName: Text("Shokhi User"),
      //           accountEmail: Text("shokhiuser@example.com"),
      //         ),
      //         ListTile(
      //           leading: const Icon(Icons.login),
      //           title: const Text("Login with Google"),
      //           onTap: () async {
      //             // Implement Google Sign-in logic here
      //             // You'll need to install and use the `google_sign_in` package
      //             // Refer to https://pub.dev/packages/google_sign_in for details
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: const ChatPage(),
    );
  }
}
