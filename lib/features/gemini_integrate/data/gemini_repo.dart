import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:meal_recommendations_a2/features/gemini_integrate/data/gemini_response.dart';

class GeminiRepository {
  final Gemini _gemini = Gemini.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<MealRecommendationResponse> getMealRecommendation(String request) async {
    final response = await _gemini.text(request);

    if (response != null) {
      final mealResponse = MealRecommendationResponse(output: response.output);
      await saveResponseToFirestore(mealResponse);
      return mealResponse;
    } else {
      throw Exception('No response from Gemini API');
    }
  }

  Future<void> saveResponseToFirestore(MealRecommendationResponse response) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception("No logged-in user found");

    try {
      await _firestore.collection('users').doc(user.uid).collection('meals').add({
        'response': response.output,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to save response to Firestore: $e');
    }
  }
}
