import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class LlamaApiService {
  final String _baseUrl = 'https://api.together.xyz/v1';
  final String _apiKey;

  LlamaApiService(this._apiKey);

  // Method to send messages to the Llama API
  Future<String> getChatbotResponse(String userMessage, String context) async {
    // Prepare the request body
    final Map<String, dynamic> requestBody = {
      'model': 'meta-llama/Llama-3-8b-chat-hf', // Together AI Llama 3 model
      'messages': [
        {
          'role': 'system',
          'content':
              'You are a specialized medical and fitness assistant. ONLY answer questions related to health, medicine, exercise, nutrition, and wellness. If a question is not related to these topics, politely decline to answer and explain that you can only provide information about medical and fitness topics. $context'
        },
        {'role': 'user', 'content': userMessage}
      ],
      'temperature': 0.7,
      'max_tokens': 500,
    };

    try {
      // Create a HttpClient that accepts all certificates (for development only)
      final httpClient = HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);

      final request =
          await httpClient.postUrl(Uri.parse('$_baseUrl/chat/completions'));
      request.headers.set('Content-Type', 'application/json');
      request.headers.set('Authorization', 'Bearer $_apiKey');
      request.write(jsonEncode(requestBody));

      final response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();

      if (response.statusCode == 200) {
        final responseData = jsonDecode(responseBody);
        return responseData['choices'][0]['message']['content'];
      } else {
        throw Exception(
            'Failed to get response: ${response.statusCode}, $responseBody');
      }
    } catch (e) {
      throw Exception('Error communicating with Llama API: $e');
    }
  }
}
