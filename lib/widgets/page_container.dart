import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  final Widget body;
  final String title;

  const PageContainer({Key? key, required this.body, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}