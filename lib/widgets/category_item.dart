import 'package:flutter/material.dart';
import 'package:section_7/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({Key? key, required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/meals', arguments: {'category': category});
        },
        borderRadius: BorderRadius.circular(24),
        splashColor: category.color.withOpacity(0.7),
        child: PhysicalModel(
          elevation: 8,
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(24),
          shadowColor: Colors.black,
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 8, left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                  colors: [category.color.withOpacity(0.6), category.color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.25, 1]),
            ),
            child: Text(
              category.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
