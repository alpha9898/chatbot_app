import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.health_and_safety, color: Theme.of(context).primaryColor),
          const SizedBox(width: 8.0),
          const Text('Medical & Fitness Assistant'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'This specialized assistant can ONLY answer questions about:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.0),
          _BulletPoint(text: 'Medical topics and health conditions'),
          _BulletPoint(text: 'Fitness exercises and workout routines'),
          _BulletPoint(text: 'Nutrition and dietary advice'),
          _BulletPoint(text: 'Wellness and preventive healthcare'),
          SizedBox(height: 12.0),
          Text(
            'Important: This app provides general information only and should not replace professional medical advice.',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.red),
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
          child: const Text('TRY IT NOW'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('GOT IT'),
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
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
