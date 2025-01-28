import 'package:daily_rank/widgets/page_container.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageContainer(
      title: 'Daily Rank',
      body: RankYourFavoriteCities(),
    );
  }
}

class RankYourFavoriteCities extends StatefulWidget {
  const RankYourFavoriteCities({super.key});

  @override
  _RankYourFavoriteCitiesState createState() => _RankYourFavoriteCitiesState();
}

class _RankYourFavoriteCitiesState extends State<RankYourFavoriteCities> {
  List<String> cities = ['Chicago', 'Los Angeles', 'Miami', 'New York', 'Houston'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Rank your favorite cities'),
        ),
        Expanded(
          child: ReorderableListView(
            onReorder: _onReorder,
            children: List.generate(cities.length, (index) {
              return ListTile(
                key: ValueKey('city$index'), // Ensure each key is unique
                title: Text(cities[index]),
                leading: Text('${index + 1}'),
                trailing: const Icon(Icons.reorder),
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final String item = cities.removeAt(oldIndex);
      cities.insert(newIndex, item);
    });
  }
}