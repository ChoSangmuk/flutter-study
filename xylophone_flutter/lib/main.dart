import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void _playSound(int noteId) {
    AudioCache player = AudioCache();
    player.play('note$noteId.wav');
  }

  Expanded _makeKey({int noteId = 1, Color color = Colors.white}) {
    // 선언적 파라미터, 기본값 설정
    return Expanded(
      child: TextButton(
        onPressed: () {
          // onPressed 되었을 때, _playSound() 실행
          _playSound(noteId);
        },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            // Column : 다중 child를 하위 속성으로 가짐
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _makeKey(noteId: 1, color: Colors.red),
              _makeKey(noteId: 2, color: Colors.orange),
              _makeKey(noteId: 3, color: Colors.yellow),
              _makeKey(noteId: 4, color: Colors.green),
              _makeKey(noteId: 5, color: Colors.teal),
              _makeKey(noteId: 6, color: Colors.blue),
              _makeKey(noteId: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
