import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; /* 외부 패키지 가져오기*/

void main() => runApp(MyApp());

class RandomWords extends StatefulWidget {
  /* RandomWords 라는 StatefulWidget을 만들고 _RandomWordsState을 생성 */
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  /* State클래스 상속 */
  final _suggestions = <WordPair>[]; /* 단어 저장을 위해 배열 생성 */
  final _biggerFont = const TextStyle(fontSize: 18.0); /* 글자 크기 조정 */

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random(); /* 랜덤 값 가져오기 */
    // return Text(wordPair.asPascalCase); /* 랜덤으로 생성된 값을 Text안에 넣어 반환 */
    return Scaffold(
      /* _RandomWordsState 위젯이 Scaffold을 반환 */
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    /* ListView widget을 반환하는 함수 작성 */
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) /* ListView의 각 행 앞에 구분선 위젯을 추가 */
          return Divider();

        final index = i ~/ 2; /* i를 2로 나눈 몫 = ListView의 단어 수 */
        if (index >= _suggestions.length) {
          /* 가능한 단어를 모두 사용했다면 10개 생성, 목록에 추가 */
          _suggestions.addAll(generateWordPairs().take(10));
        }
        // return ListTile(
        //   title: Text(
        //     _suggestions[index].asPascalCase,
        //     style: _biggerFont,
        //   ),
        // );
        return _buildRow(_suggestions[index]); /* 함수로 작성하여 처리 */
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    /* 함수로 ListTile들을 생성 */
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  /* MaterialApp 위젯을 반환, MaterialApp 위젯를 통해 앱을 구성 */
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random(); /* 랜덤 값 가져오기 */
    return MaterialApp(
      // /* MaterialApp의 title, home이라는 구성 요소를 가짐  */
      // title: 'Welcome to Flutter',
      // /* title의 값으로는 Welcome to Flutter'라는 값이 들어감 */
      // home: Scaffold(
      //   /* home이라는 구성 요소에는 Scaffold 위젯이 들어가며,
      //   Scaffold는 appBar와 body를 위젯으로 가짐*/
      //   appBar: AppBar(
      //     title: const Text('Welcome to Flutter'),
      //   ),
      //   body: /* 랜덤 값을 가져와 표현 함으로 const 제거 */ Center(
      //     // child: const Text('Hello World'),
      //     // child: Text(wordPair.asPascalCase), /* 화면에 나타내기 */
      //     child: RandomWords(), /* Text() 대신 RandomWords() 사용 */
      //   ),
      // ),
      title: 'Startup Name Generator',
      home: RandomWords(), /* RandomWords가 Scaffold를 반환 */
    );
  }
}
