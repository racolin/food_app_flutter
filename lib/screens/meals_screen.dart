import 'package:flutter/material.dart';
import 'package:section_7/models/category.dart';
import 'package:section_7/models/meal.dart';
import 'package:section_7/widgets/meal_item.dart';

class MealsInCategoryScreen extends StatefulWidget {
  final List<Meal> meals;

  const MealsInCategoryScreen({Key? key, required this.meals})
      : super(key: key);

  @override
  State<MealsInCategoryScreen> createState() => _MealsInCategoryScreenState();
}

class _MealsInCategoryScreenState extends State<MealsInCategoryScreen> {
  List<Meal> meals = [];
  var category;
  List<Meal> getMealsFromCategory(Category category) {
    return widget.meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
  }

  var unloaded = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (unloaded) {
      category = (ModalRoute.of(context)?.settings.arguments
          as Map<String, Category>)['category']!;
      meals = getMealsFromCategory(category);
    }
    unloaded = false;
    super.didChangeDependencies();
  }

  void removeItemById(String id) {
    setState(() {
      meals.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => MealItem(
          meal: meals[index],
          removeItemById: removeItemById,
        ),
        itemCount: meals.length,
      ),
    );
  }
}
