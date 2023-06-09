import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(this.currentFilters, this.saveFilters, {super.key});

  static const routeName = "/filters";

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['glutten']!;
    _vegeterian = widget.currentFilters['vegeterian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'glutten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegeterian': _vegeterian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
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
      ),
    );
  }
}
