import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavedSuggestion extends StatelessWidget {
  final List<WordPair> items;
  SavedSuggestion({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tiles = items.map((WordPair wordPair) {
      return ListTile(
        title: Text(wordPair.asPascalCase, style: TextStyle(fontSize: 18.0)),
      );
    });
    return Scaffold(
      appBar: AppBar(title: Text('Saved Suggestion')),
      body: ListView(
        children: ListTile.divideTiles(tiles: tiles, context: context).toList(),
      ),
    );
  }
}
