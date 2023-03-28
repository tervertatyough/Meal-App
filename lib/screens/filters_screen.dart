import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  static const routeName = "/filters";

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Filters")),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Adjuust your meal selection",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: const Text("Gluten-free"),
                    value: _glutenFree,
                    subtitle: const Text(
                      "Only include gluten-free meals.",
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text("Lactose-free"),
                    value: _lactoseFree,
                    subtitle: const Text(
                      "Only include lactose-free meals.",
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text("Vegeterian"),
                    value: _vegeterian,
                    subtitle: const Text(
                      "Only include vegeterian meals.",
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _vegeterian = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text("Vegan"),
                    value: _vegan,
                    subtitle: const Text(
                      "Only include vegan meals.",
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
