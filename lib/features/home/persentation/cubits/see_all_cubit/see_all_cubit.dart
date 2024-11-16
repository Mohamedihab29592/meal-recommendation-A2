import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_recommendations_a2/core/services/secure_storage.dart';
import 'package:meal_recommendations_a2/features/home/domain/Model/see_all_model.dart';
import 'package:meal_recommendations_a2/features/home/persentation/cubits/see_all_cubit/see_all_state.dart';

class SeeAllCubit extends Cubit<SeeAllCubitState> {
  SeeAllCubit() : super(SeeAllInitial());

  final SecureStorageService secureStorageService = SecureStorageService();

  Future<void> fetchMealData() async {
    emit(SeeAllLoading());
    try {
      String? uid = await secureStorageService.getUID();
      if (uid == null) {
        return emit(SeeAllError("User not logged In"));
      }

      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (snapshot.exists && snapshot.data() != null) {
        debugPrint("Data fetched: ${snapshot.data()}");
        List<SeeAllModel> meals = [];
        for (int i = 0; i < snapshot.data()?["meals"].length; i++) {
          meals.add(SeeAllModel.fromJson(snapshot.data()?["meals"][i], i.toString()));
        }

        emit(SeeAllLoaded(meals));
      } else {
        emit(SeeAllError("No data found for this meal."));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(SeeAllError("Failed to load meal data: $e"));
    }
  }
}
