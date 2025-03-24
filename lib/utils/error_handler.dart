class ErrorHandler {
  static String getReadableError(String errorMessage) {
    if (errorMessage.contains('CERTIFICATE_VERIFY_FAILED') ||
        errorMessage.contains('HandshakeException')) {
      return 'Connection to the AI service is not secure. Please check your network connection or try again later.';
    } else if (errorMessage.contains('SocketException') ||
        errorMessage.contains('Connection refused')) {
      return 'Unable to connect to the AI service. Please check your internet connection and try again.';
    } else if (errorMessage.contains('timed out')) {
      return 'The request timed out. Please try again later.';
    } else if (errorMessage.contains('401') ||
        errorMessage.contains('403') ||
        errorMessage.contains('authentication')) {
      return 'Authentication error. Please check your API key.';
    } else if (errorMessage.contains('429') ||
        errorMessage.contains('quota exceeded') ||
        errorMessage.contains('rate limit')) {
      return 'The AI service request limit has been reached. Please try again later.';
    } else {
      // Return a generic error message for any other error
      return 'Something went wrong. Please try again later.';
    }
  }
}
