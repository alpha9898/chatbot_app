import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.brightnessOf(context) == Brightness.dark;

    return CupertinoAlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.heart_fill,
              color: CupertinoTheme.of(context).primaryColor,
              size: 20,
            ),
            const SizedBox(width: 8.0),
            const Flexible(
              child: Text(
                'Medical & Fitness Assistant',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This specialized assistant can ONLY answer questions about:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDark ? CupertinoColors.white : CupertinoColors.black,
              ),
            ),
            const SizedBox(height: 8.0),
            _BulletPoint(text: 'Medical topics and health conditions'),
            _BulletPoint(text: 'Fitness exercises and workout routines'),
            _BulletPoint(text: 'Nutrition and dietary advice'),
            _BulletPoint(text: 'Wellness and preventive healthcare'),
            const SizedBox(height: 12.0),
            Text(
              'Important: This app provides general information only and should not replace professional medical advice.',
              style: TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: CupertinoColors.destructiveRed,
              ),
            ),
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
            Provider.of<ChatProvider>(context, listen: false).addUserMessage(
                "What are some effective exercises for strengthening the lower back?");
          },
          child: Text(
            'Try Sample Question',
            style: TextStyle(color: CupertinoTheme.of(context).primaryColor),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          isDefaultAction: true,
          child: Text(
            'Got It',
            style: TextStyle(color: CupertinoTheme.of(context).primaryColor),
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
    final isDark = CupertinoTheme.brightnessOf(context) == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•  ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDark ? CupertinoColors.white : CupertinoColors.black,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? CupertinoColors.white : CupertinoColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
