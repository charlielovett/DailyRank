import 'package:daily_rank/widgets/page_container.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageContainer(
      title: "Daily Rank",
      body: Center(
        child: Text("Results Page"),
      ),
    );
  }
}