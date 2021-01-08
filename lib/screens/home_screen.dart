import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_names_generator/screens/saved_suggestion.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() {
    return _RandomWordsState();
  }
}

class _RandomWordsState extends State<HomeScreen> {
  final _suggestions = <WordPair>[];
  final _saved = List<WordPair>();
  final _fontSize = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Generators'),
        actions: [IconButton(icon: Icon(Icons.list), onPressed: _onSave)],
      ),
      body: _buildSuggestion(),
    );
  }

  Widget _buildSuggestion() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair wordPair) {
    final alreadySaved = _saved.contains(wordPair);
    return ListTile(
      title: Text(wordPair.asPascalCase, style: _fontSize),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }

  void _onSave() {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) => SavedSuggestion(items: _saved)));
  }
}
