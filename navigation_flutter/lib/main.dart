import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Navigation with Arguments',
      initialRoute: '/',
      routes: {
        // Route 정의하기 - MaterialApp 생성자에 initialRoute와 routes 이름의 추가 프로퍼티를 제공하여 route를 정의
        '/': (context) => SenderScreen(),
        // '/receiverScreen': (context) => ReceiverScreen(),
        ReceiverScreen.routeName: (context) => ReceiverScreen(),
      },
    ));

// 1. Route간 전달할 인자값 정의
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

// 2. ModalRoute 로 부터 인자 값을 추출하고 표시하는 화면
class ReceiverScreen extends StatelessWidget {
  static const routeName = '/receiverScreen';

  @override
  Widget build(BuildContext context) {
    // ModalRoute.of 메소드를 통해 현재 ModalRoute의 설정을 추출하여 ScreenArguments로 저장
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

// 3. 인자값을 던지는 SenderScreen 화면 작성
class SenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text("Navigate to screen that extracts arguments"),
        onPressed: () {
          // Navigator.pushNamed(.., parameter)를 통해 named route에게 arguments를 전달, 이동
          Navigator.pushNamed(
            context,
            ReceiverScreen.routeName,
            arguments: ScreenArguments(
              'Extract Arguments Screen',
              'This message is extracted in the build method.',
            ),
          );
        },
      )),
    );
  }
}
