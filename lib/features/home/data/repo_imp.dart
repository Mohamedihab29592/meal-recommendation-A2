import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';
import '../../../core/helper/meal_helper.dart';

class FirestoreService implements MealService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Meal>> getMeals() {
    return _firestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots().map((snapshot) {
      final mealData = snapshot.data();
      final meals = (mealData!['meals'] as List<dynamic>);
      final List<Meal> allMeals = [];
      for (int i = 0; i < meals.length; i++) {
        allMeals.add(Meal.fromMap(meals[i] as Map<String, dynamic>, i.toString()));
      }
      return allMeals;
    });
  }
}
