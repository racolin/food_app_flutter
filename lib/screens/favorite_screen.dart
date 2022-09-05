import 'package:flutter/widgets.dart';
import 'package:section_7/models/meal.dart';
import 'package:section_7/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text(
              'You don\'t add any favorite meals yet!',
              style: TextStyle(fontSize: 16),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) => MealItem(
              meal: favoriteMeals[index],
              removeItemById: () {},
            ),
            itemCount: favoriteMeals.length,
          );
  }
}
