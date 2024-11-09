import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_recommendations_a2/features/home/data/see_all_model.dart';
import 'package:meal_recommendations_a2/features/home/persentation/cubits/see_all_cubit/see_all_state.dart';

class SeeAllCubit extends Cubit<SeeAllCubitState> {
  SeeAllCubit() : super(SeeAllInitial());

  Future<void> fetchMealData() async {
    emit(SeeAllLoading());
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('meals')
          .doc('MD50MoYK2JdVGNKxk0LRSRxlqav2')
          .get();

      if (snapshot.exists && snapshot.data() != null) {
        print("Data fetched: ${snapshot.data()}");
        SeeAllModel meal = SeeAllModel.fromJson(snapshot.data()!);
        emit(SeeAllLoaded(meal));
      } else {
        emit(SeeAllError("No data found for this meal."));
      }
    } catch (e) {
      emit(SeeAllError("Failed to load meal data: $e"));
    }
  }
}
