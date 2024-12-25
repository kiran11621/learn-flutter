import 'package:flutter/material.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote of the Day!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Text('Quote of the Day'),
        ),
      ),
    );
  }
}
