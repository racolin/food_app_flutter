import 'package:flutter/material.dart';
import 'package:section_7/models/meal.dart';
import 'package:section_7/screens/categories_screen.dart';
import 'package:section_7/screens/favorite_screen.dart';
import 'package:section_7/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages = [];
  bool unload = true;
  @override
  void initState() {
    pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoriteScreen(favoriteMeals: widget.favoriteMeals),
        'title': 'Favorite'
      },
    ];
    super.initState();
  }

  var index = 0;
  void changePage(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[index]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: pages[index]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          changePage(value);
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            label: pages[0]['title'] as String,
            icon: const Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: pages[1]['title'] as String,
            icon: const Icon(Icons.star_rate),
          ),
        ],
      ),
    );
  }
}
