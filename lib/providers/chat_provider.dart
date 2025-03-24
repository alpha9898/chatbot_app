import 'package:flutter/foundation.dart';
import '../services/llama_api_service.dart';
import '../utils/error_handler.dart';

class ChatMessage {
  final String content;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.content,
    required this.isUser,
    required this.timestamp,
  });
}

class ChatProvider with ChangeNotifier {
  final LlamaApiService _apiService;
  List<ChatMessage> _messages = [];
  bool _isLoading = false;
  String _currentCategory = 'medical'; // Options: 'medical', 'fitness'

  ChatProvider(this._apiService);

  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;
  String get currentCategory => _currentCategory;

  void setCategory(String category) {
    if (category == 'medical' || category == 'fitness') {
      _currentCategory = category;
      notifyListeners();
    }
  }

  void addUserMessage(String content) {
    _messages.add(
      ChatMessage(
        content: content,
        isUser: true,
        timestamp: DateTime.now(),
      ),
    );
    notifyListeners();

    // After adding user message, get bot response
    _getBotResponse(content);
  }

  Future<void> _getBotResponse(String userMessage) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Set context based on the current category
      String context = '';
      if (_currentCategory == 'medical') {
        context =
            'Focus on medical topics. Provide accurate medical information with appropriate disclaimers. Always remind users to consult with healthcare professionals for personalized advice.';
      } else if (_currentCategory == 'fitness') {
        context =
            'Focus on fitness topics. Provide exercise, nutrition, and wellness advice with safety considerations. Always remind users to consult with fitness professionals for personalized advice.';
      }

      final response =
          await _apiService.getChatbotResponse(userMessage, context);

      _messages.add(
        ChatMessage(
          content: response,
          isUser: false,
          timestamp: DateTime.now(),
        ),
      );
    } catch (error) {
      _messages.add(
        ChatMessage(
          content: ErrorHandler.getReadableError(error.toString()),
          isUser: false,
          timestamp: DateTime.now(),
        ),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearChat() {
    _messages = [];
    notifyListeners();
  }
}
