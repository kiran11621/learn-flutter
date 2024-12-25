import 'package:flutter/material.dart';
import 'package:flutter_provider/quote_provider.dart';
import 'package:provider/provider.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late QuotesProvider _quoteProvider;

  @override
  Widget build(BuildContext context) {
    _quoteProvider = Provider.of<QuotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote of the Day!'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () async {
              await _quoteProvider.fetchQuote();
            },
            child: Card(
              semanticContainer: true,
              child: Container(
                height: 400,
                width: 300,
                color: Colors.amber[100],
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (_quoteProvider.quote?[0].q ?? "Click Me..."),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          ("~ ${_quoteProvider.quote?[0].a}"),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
