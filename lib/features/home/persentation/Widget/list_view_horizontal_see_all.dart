import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/features/home/domain/Model/see_all_model.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/item_horizontal_see_all.dart';

class ListViewHorizontalSeeAll extends StatelessWidget {
  const ListViewHorizontalSeeAll({super.key, required this.seeAllModels});

  final List<SeeAllModel> seeAllModels;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.22,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: seeAllModels.length,
        itemBuilder: (context, index) {
          return ItemHorizontalSeeAll(
            seeAllModel: seeAllModels[index],
          );
        },
      ),
    );
  }
}
