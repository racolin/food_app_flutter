import 'package:flutter/material.dart';
import 'package:section_7/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function setFilter;
  final Map<String, bool> filter;
  const FilterScreen({
    Key? key,
    required this.setFilter,
    required this.filter,
  }) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  void change(bool value, int type) {
    setState(() {
      switch (type) {
        case 0:
          widget.filter['_isGlutenFree'] = value;
          break;
        case 1:
          widget.filter['_isVegan'] = value;
          break;
        case 2:
          widget.filter['_isVegetarian'] = value;
          break;
        case 3:
          widget.filter['_isLactoseFree'] = value;
          break;
      }
    });
  }

  SwitchListTile createSwitchListTile(
      String title, String subTitle, bool state, Function(bool) fn) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: state,
      onChanged: fn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filter')),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 64,
            width: double.infinity,
            child: const Text(
              'Adjust your meal selection',
              style: TextStyle(fontSize: 24),
            ),
          ),
          createSwitchListTile(
            'Gluten-Free',
            'Only include gluten-free meals.',
            widget.filter['_isGlutenFree']!,
            (value) {
              change(value, 0);
            },
          ),
          createSwitchListTile(
            'Vegan',
            'Only include vegan meals.',
            widget.filter['_isVegan']!,
            (value) {
              change(value, 1);
            },
          ),
          createSwitchListTile(
            'Vegetarian',
            'Only include vegetarian meals.',
            widget.filter['_isVegetarian']!,
            (value) {
              change(value, 2);
            },
          ),
          createSwitchListTile(
            'Lactose-Free',
            'Only include lactose-free meals.',
            widget.filter['_isLactoseFree']!,
            (value) {
              change(value, 3);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          widget.setFilter(<String, bool>{
            '_isGlutenFree': widget.filter['_isGlutenFree']!,
            '_isVegan': widget.filter['_isVegan']!,
            '_isVegetarian': widget.filter['_isVegetarian']!,
            '_isLactoseFree': widget.filter['_isLactoseFree']!,
          });
        }),
        child: const Icon(Icons.save),
      ),
    );
  }
}
