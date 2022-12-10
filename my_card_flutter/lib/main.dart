import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _makecard({Icon leadingIcon, String titleText, Icon trailingIcon}) {
    /* card 생성 부분을 함수로 분리 refactoring */
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ListTile(
        leading: leadingIcon,
        title: Text(
          titleText,
          /* 받아온 변수를 출력 */
          style: TextStyle(
            color: Colors.lightBlue.shade900,
            fontSize: 20,
          ),
        ),
        trailing: trailingIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow.shade200,
        /* shade는 선명함을 나타내는 정도, 명시하지 않으면 500이 기본값  */
        body: SafeArea(
          child: Column(
            /* Column 위젯은 children을 입력 순서대로 세로로 화면에 배열하게함 */
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.0,
                // child: Text('AH'), /* 이미지 설정을 안한 경우 default text로 활용 */
                // backgroundColor: Colors.brown.shade800, /* 이미지 설정을 안한 경우 default 이미지로 활용 */
                // backgroundImage: NetworkImage(userAvatarUrl), /* 네트워크에서 이미지 가져오기 */
                backgroundImage: AssetImage('potato.jpeg'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Cho Sangmuk',
                style: TextStyle(
                  fontFamily: 'NanumPenScript',
                  /* 폰트 family 이름으로 사용 */
                  fontWeight: FontWeight.bold,
                  fontSize: 45.0,
                  color: Colors.blue.shade200,
                ),
              ),
              Text(
                'Flutter Develper',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue.shade200,
                ),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.lightBlue.shade900,
                  thickness: 1.5,
                ),
              ),
              _makecard(
                leadingIcon: Icon(
                  Icons.phone,
                  color: Colors.lightBlue.shade900,
                ),
                titleText: '010-2990-7436',
                trailingIcon: Icon(
                  Icons.favorite,
                  color: Colors.pink.shade300,
                ),
              ),
              _makecard(
                leadingIcon: Icon(
                  Icons.mail,
                  color: Colors.lightBlue.shade900,
                ),
                titleText: 'tkdanr612@gmail.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
