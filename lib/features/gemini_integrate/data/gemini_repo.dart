import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiRepository {
  final Gemini _gemini = Gemini.instance;

  Gemini get gemini => _gemini;
}
