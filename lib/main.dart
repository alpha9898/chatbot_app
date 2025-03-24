import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'services/llama_api_service.dart';
import 'providers/chat_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/chat_screen.dart';
import 'config/api_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChatProvider(
            LlamaApiService(ApiConfig.llamaApiKey),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return CupertinoApp(
            title: 'Medical & Fitness Assistant',
            theme: CupertinoThemeData(
              brightness: themeProvider.brightness,
              primaryColor: themeProvider.primaryColor,
              barBackgroundColor: themeProvider.isDarkMode
                  ? CupertinoColors.black
                  : CupertinoColors.white,
              scaffoldBackgroundColor: themeProvider.isDarkMode
                  ? CupertinoColors.black
                  : CupertinoColors.white,
              textTheme: CupertinoTextThemeData(
                primaryColor: themeProvider.primaryColor,
                textStyle: TextStyle(
                  color: themeProvider.isDarkMode
                      ? CupertinoColors.white
                      : CupertinoColors.black,
                ),
              ),
            ),
            home: const ChatScreen(),
          );
        },
      ),
    );
  }
}
