import 'package:flutter/material.dart';
import 'screens/game.dart';
import 'screens/results.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    ColorScheme dailyRankTheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF7E71FC),
      brightness: Brightness.light,
    );
    
    return MaterialApp(
      title: 'Daily Rank',
      theme: ThemeData(
        colorScheme: dailyRankTheme,
        useMaterial3: true,
      ),
      home: GamePage(), // Start with the Game Page
      routes: {
        '/game': (context) => GamePage(),
        '/results': (context) => ResultsPage(),
      },
    );
  }
}