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
  List<String> cities = [
    'Chicago',
    'Los Angeles',
    'Miami',
    'New York',
    'Houston'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Rank your\nfavorite cities',
              style: TextStyle(
                color: Colors.black,
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height *
                          0.4 /
                          cities.length, // Adjust height relative to screen
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(1),
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('${index + 1}'),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 8,
                child: ReorderableListView.builder(
                  itemCount: cities.length,
                  onReorder: _onReorder,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      key: ValueKey(cities[index]),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.4 /
                            cities.length, // Adjust height relative to screen
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            title: Text(cities[index]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 26.0),
          child: SizedBox(
            width: double.infinity, // 80% of screen width
            height: 60,
            child: ElevatedButton(
              onPressed: () {debugPrint("Submit");},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
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
