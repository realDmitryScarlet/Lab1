import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

int y = 0;
void main() => runApp(MyApp());

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 14.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Генератор случайных наименований'),
        backgroundColor: Color(0xFFD13C16),
        textTheme: TextTheme(
            headline6: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat')),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(18.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          y++;
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final beforeCapitalLetter = RegExp(r"(?=[A-Z])");
    return ListTile(
      title: Text(
        '№' + y.toString() + ': ' + pair.asPascalCase.toString(),
        style: _biggerFont,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: RandomWords(),
    );
  }
}
