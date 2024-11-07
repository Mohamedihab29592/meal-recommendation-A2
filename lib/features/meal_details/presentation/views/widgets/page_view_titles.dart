import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/features/meal_details/presentation/views/widgets/ingrediantes_view.dart';
import 'package:meal_recommendations_a2/features/meal_details/presentation/views/widgets/page_view_title_item.dart';
import 'package:meal_recommendations_a2/features/meal_details/presentation/views/widgets/summary_view.dart';
import 'package:meal_recommendations_a2/main.dart';

class PageViewTitles extends StatefulWidget {
  const PageViewTitles({super.key});

  @override
  State<PageViewTitles> createState() => _PageViewTitlesState();
}

class _PageViewTitlesState extends State<PageViewTitles> {
  final List<String> titles = ["Summary", "Ingrediantes", "Direction"];
  final List<Widget> pages = [SummaryView(model: meal!), IngrediantesView(model: meal!), const SizedBox()];
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: PageViewTitleItem(
                title: titles[0],
                isSelected: selectedIndex == 0,
                onTap: () {
                  selectedIndex = 0;
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: PageViewTitleItem(
                title: titles[1],
                isSelected: selectedIndex == 1,
                onTap: () {
                  selectedIndex = 1;
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: PageViewTitleItem(
                title: titles[2],
                isSelected: selectedIndex == 2,
                onTap: () {
                  selectedIndex = 2;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 10),
        pages[selectedIndex],
      ],
    );
  }
}
