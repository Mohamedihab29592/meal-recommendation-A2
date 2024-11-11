import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/features/home/domain/Model/see_all_model.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/item_vertical_see_all.dart';

class ListViewVerticalSeeAll extends StatelessWidget {
  const ListViewVerticalSeeAll({super.key, required this.seeAllModels});

  final List<SeeAllModel> seeAllModels;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: seeAllModels.length,
      itemBuilder: (context, index) {
        return ItemVerticalSeeAll(
          seeAllModel: seeAllModels[index],
        );
      },
    );
  }
}
