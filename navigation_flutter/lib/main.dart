import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named routes Demo',
    // initialRoute 프로퍼티는 앱의 시작점을 나타내는 route를 정의
    // "/"을 앱이 시작하게 될 route로 지정, 본 예제에서는 FirstScreen 위젯이 첫 번째 페이지로 사용
    // initialRoute를 사용할때, home프로퍼티를 정의하면 오류
    initialRoute: '/',
    // Route 정의하기 - MaterialApp 생성자에 initialRoute와 routes 이름의 추가 프로퍼티를 제공하여 route를 정의
    // routes 프로퍼티는 이용가능한 named route와 해당 route로 이동했을 때 빌드될 위젯을 정의
    routes: {
      // "/" Route로 이동하면, FirstScreen 위젯을 생성
      '/': (context) => FirstScreen(),
      // "/second" route로 이동하면, SecondScreen 위젯을 생성
      '/second': (context) => SecondScreen(),
    },
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go Second Route!'),
          onPressed: () {
            // Named route를 사용하여 두 번째 화면으로 전환
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go First Route!'),
          onPressed: () {
            // 현재 route를 스택에서 제거함으로써 첫 번째 화면(route)로 화면 전환
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
