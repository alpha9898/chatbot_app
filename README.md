# Medical & Fitness Assistant

A specialized Flutter application that provides medical and fitness guidance using the Llama AI model. The app features a modern iOS-style interface with customizable themes and a dark mode.

## Features

- **Medical Q&A**: Get answers to medical questions and health-related inquiries
- **Fitness Guidance**: Receive workout routines and exercise recommendations
- **Nutrition Advice**: Get dietary suggestions and nutritional information
- **iOS-Style Interface**: Clean, modern UI following iOS design guidelines
- **Theme Customization**:
  - Dark mode enabled by default
  - 8 different accent colors to choose from
  - Persistent theme preferences
- **Category Selection**: Switch between medical and fitness topics
- **Chat History**: View and clear conversation history

## Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Configure the API:
   - Rename `lib/config/api_config_template.dart` to `api_config.dart`
   - Add your Llama API key from Together AI

4. Run the app:
   ```bash
   flutter run
   ```

## Theme Customization

The app includes a comprehensive theme system:
- Access theme settings via the gear icon in the top-right corner
- Toggle between dark and light modes
- Choose from 8 different accent colors:
  - System Blue
  - System Green
  - System Indigo
  - System Orange
  - System Pink
  - System Purple
  - System Red
  - System Teal

Theme preferences are automatically saved and restored between sessions.

## Important Note

This app provides general information only and should not replace professional medical advice. Always consult qualified healthcare professionals for medical concerns.

## Technologies Used

- Flutter
- Provider for state management
- Llama AI through Together AI's API
- Shared Preferences for theme persistence
- HTTP for API communication
- iOS-style Cupertino widgets

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.