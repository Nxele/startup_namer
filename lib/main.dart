import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp()); // main method

//main stateless (immutable) widget with the theme
class MyApp extends StatelessWidget {
  // give my app an widget
  @override
  Widget build(BuildContext context) {
    //build the widget
    return MaterialApp(
      //return select the app theme
      title: 'Word Generator',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: RandomWords(),
    );
  }
}

// statefull widget mutable that extends an StatefulWidget
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('words Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}
