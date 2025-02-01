import 'package:flutter/material.dart';
import 'screens/game.dart';
import 'screens/results.dart';
import './utilities/theme.dart'; // Make sure the path matches where you've placed the file


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Daily Rank',
      theme: AppTheme.customTheme,
      home: GamePage(), // Start with the Game Page
      routes: {
        '/game': (context) => GamePage(),
        '/results': (context) => ResultsPage(),
      },
    );
  }
}