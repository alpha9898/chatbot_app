import 'package:flutter/material.dart';
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
          return MaterialApp(
            title: 'Medical & Fitness Assistant',
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
            ),
            home: const ChatScreen(),
          );
        },
      ),
    );
  }
}
