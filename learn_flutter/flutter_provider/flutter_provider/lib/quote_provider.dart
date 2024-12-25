import 'package:flutter/material.dart';
import 'package:flutter_provider/quote_model.dart';
import 'package:http/http.dart' as http;

class QuotesProvider extends ChangeNotifier {
  List<Quote>? quote;

  Future<void> fetchQuote() async {
    final response =
        await http.get(Uri.parse('https://zenquotes.io/api/random'));

    if (response.statusCode == 200) {
      quote = quoteFromJson(response.body);
    } else {
      throw Exception("Something went wrong...");
    }

    notifyListeners();
  }
}
