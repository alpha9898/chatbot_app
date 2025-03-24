import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AlertDialog(
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      title: Row(
        children: [
          Icon(Icons.health_and_safety,
              color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8.0),
          Text(
            'Medical & Fitness Assistant',
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This specialized assistant can ONLY answer questions about:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 12.0),
          _BulletPoint(text: 'Medical topics and health conditions'),
          _BulletPoint(text: 'Fitness exercises and workout routines'),
          _BulletPoint(text: 'Nutrition and dietary advice'),
          _BulletPoint(text: 'Wellness and preventive healthcare'),
          const SizedBox(height: 12.0),
          Text(
            'Important: This app provides general information only and should not replace professional medical advice.',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.red[isDark ? 400 : 600],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            // Add a sample query to demonstrate the chatbot
            Provider.of<ChatProvider>(context, listen: false).addUserMessage(
                "What are some effective exercises for strengthening the lower back?");
          },
          child: Text(
            'TRY IT NOW',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'GOT IT',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
