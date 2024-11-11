import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';
import '../../../core/helper/meal_helper.dart';

class FirestoreService implements MealService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Meal>> getMeals() {
    return _firestore.collection('meals').snapshots().map((snapshot) {
      final mealDocs = snapshot.docs;
      if (mealDocs.isNotEmpty) {
        final mealData = mealDocs[0].data();
        final meals = (mealData['meals'] as List<dynamic>);
        final List<Meal> allMeals = [];
        for (int i = 0; i < meals.length; i++) {
          allMeals.add(Meal.fromMap(meals[i] as Map<String, dynamic>, i.toString()));
        }
        return allMeals;
      }
      return [];
    });
  }
}
