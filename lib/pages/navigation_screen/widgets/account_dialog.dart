import 'package:flutter/material.dart';
import 'package:shokhi/pages/navigation_screen/widgets/dialog_list_tile.dart';

class AccountDialog extends StatelessWidget {
  const AccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(8),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 40,
            child: CloseButton(),
          ),
          Text(
            "Shokhi",
            textAlign: TextAlign.center,
          ),
          SizedBox(width: 40),
        ],
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
              bottom: Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  child: const Text(
                    "S", // Replace with user image or initials
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shokhi User",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "shokhiuser@example.com",
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8),
              bottom: Radius.circular(16),
            ),
          ),
          child: Column(
            // Add other list tiles here
            children: [
              DialogListTile(
                text: "Logout",
                icon: const Icon(Icons.logout_rounded),
                onPressed: () {},
              ),
              DialogListTile(
                text: "Login with Google",
                icon: const Icon(Icons.login_rounded),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
