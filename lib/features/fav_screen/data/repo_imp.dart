import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_recommendations_a2/features/fav_screen/domain/model/FavModel.dart';
import 'data_source.dart';

class FavoriteService implements FavoriteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<FavMeal>> getFavoriteMeals() {
    return _firestore.collection('favoriteMeals').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return FavMeal.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
