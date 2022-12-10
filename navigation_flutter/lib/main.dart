import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: 'Returning Data', home: HomeScreen()));

// 1. SelectionButton을 터치하면 옵션을 선택할 수 있는 Route(SelectionScreen)을 호출하는 화면
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Returning Data Demo')),
      body: Center(child: SelectionButton()),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Is it good app? Pick an option, any option!'),
      onPressed: () => _navigateAndDisplaySelection(context),
    );
  }

  // 2. SelectionScreen을 띄우고 navigator.pop으로부터 결과를 기다리는 메서드
  _navigateAndDisplaySelection(BuildContext context) async {
    // await Navigator.push는 Future를 반환하고, Navigator.pop이 호출된 이후 진행
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    // 선택 창으로부터 결과 값을 받은 후, 이전에 있던 snackbar는 숨기고 새로운 결과 값을 나타냄
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("Your answer is $result.")));
  }
}

// 3. 옵션선택 화면, Navigator.pop()을 사용하여 이전 route로 데이터를 전달
class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _makeButton(context, 'Yep!'),
            _makeButton(context, 'Nope.'),
            _makeButton(context, 'Hmmm...'),
          ],
        ),
      ),
    );
  }

  ElevatedButton _makeButton(BuildContext context, String message) {
    return ElevatedButton(
      onPressed: () => Navigator.pop(context, message),
      child: Text(message),
    );
  }
}
