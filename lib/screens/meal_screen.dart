import 'package:flutter/material.dart';
import 'package:section_7/models/meal.dart';

class MealScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function isFavorite;
  const MealScreen({
    Key? key,
    required this.toggleFavorite,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Meal meal = (ModalRoute.of(context)?.settings.arguments
        as Map<String, Meal>)['meal']!;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 240,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Ingredients',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Column(
                children: meal.ingredients
                    .map((e) => Container(
                          padding: const EdgeInsets.fromLTRB(12, 6, 6, 6),
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: Text(
                            e,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Steps',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Column(
                children: [
                  for (int i = 0; i < meal.steps.length; i++)
                    Container(
                      decoration: const BoxDecoration(
                          // color: Colors.amber,
                          ),
                      width: double.infinity,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              meal.steps[i],
                              style: const TextStyle(fontSize: 16, height: 1.5),
                            ),
                            leading: ClipOval(
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.purple,
                                height: 42,
                                width: 42,
                                child: Text(
                                  "#${i + 1}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavorite(meal.id);
        },
        child:
            Icon(isFavorite(meal.id) ? Icons.star_rounded : Icons.star_outline),
      ),
    );
  }
}
