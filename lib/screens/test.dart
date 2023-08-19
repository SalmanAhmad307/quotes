import 'package:flutter/material.dart';
import 'package:share/share.dart';


class FriendshipQuotesScreen extends StatefulWidget {
  const FriendshipQuotesScreen({super.key});

  @override
  _FriendshipQuotesScreenState createState() => _FriendshipQuotesScreenState();
}

class _FriendshipQuotesScreenState extends State<FriendshipQuotesScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> _quotes = [
    {
      "quote": "Friendship is born at that moment when one person says to another, 'What! You too? I thought I was the only one.'",
      "author": "C.S. Lewis"
    },
    {
      "quote": "A real friend is one who walks in when the rest of the world walks out.",
      "author": "Walter Winchell"
    },
    // Add more quotes here
  ];

  void _nextQuote() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _quotes.length;
    });
  }

  void _shareQuote() {
    String quote = _quotes[_currentIndex]["quote"]!;
    String author = _quotes[_currentIndex]["author"]!;
    String text = '"$quote" - $author';

    Share.share(text);  // Use the share package to open the sharing dialog
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friendship Quotes"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _quotes[_currentIndex]["quote"]!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "- ${_quotes[_currentIndex]["author"]}",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _nextQuote,
              child: Text("Next"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _shareQuote,
              child: Text("Share"),
            ),
          ],
        ),
      ),
    );
  }
}
