import 'package:flutter/material.dart';
import 'package:section_7/data.dart';
import 'package:section_7/models/meal.dart';
import 'package:section_7/screens/filter_screen.dart';
import 'package:section_7/screens/meal_screen.dart';
import 'package:section_7/screens/meals_screen.dart';
import 'package:section_7/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> favoriteMeals = [];
  Map<String, bool> filter = {
    '_isGlutenFree': false,
    '_isVegan': false,
    '_isVegetarian': false,
    '_isLactoseFree': false,
  };

  @override
  void initState() {
    super.initState();
  }

  bool isFavorite(String mealId) {
    return favoriteMeals.any((element) => element.id == mealId);
  }

  void toggleFavorite(String mealId) {
    int index = favoriteMeals.indexWhere((element) => element.id == mealId);
    setState(() {
      if (index == -1) {
        Meal m = MEALS.firstWhere((element) => element.id == mealId);
        favoriteMeals.add(m);
      } else {
        favoriteMeals.removeAt(index);
      }
    });
    print(favoriteMeals.length);
  }

  void setFilter(Map<String, bool> filter) {
    setState(() {
      this.filter = filter;
    });
  }

  List<Meal> getAvailableMeals() {
    return MEALS.where((element) {
      if (filter['_isGlutenFree']! && !element.isGlutenFree) {
        return false;
      }
      if (filter['_isVegan']! && !element.isVegan) {
        return false;
      }
      if (filter['_isVegetarian']! && !element.isVegetarian) {
        return false;
      }
      if (filter['_isLactoseFree']! && !element.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(),
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.amber),
      ),
      routes: {
        '/': (_) => TabsScreen(favoriteMeals: favoriteMeals),
        '/meals': (_) => MealsInCategoryScreen(
              meals: getAvailableMeals(),
            ),
        '/meal_detail': (_) => MealScreen(
              toggleFavorite: toggleFavorite,
              isFavorite: isFavorite,
            ),
        '/filter_screen': (_) =>
            FilterScreen(setFilter: setFilter, filter: filter),
      },
    );
  }
}
