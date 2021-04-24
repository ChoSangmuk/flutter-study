import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow.shade200,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('potato.jpeg'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Cho Sangmuk',
                style: TextStyle(
                  fontFamily: 'NanumPenScript',
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
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
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.lightBlue.shade900,
                  ),
                  title: Text(
                    '010-2990-7436',
                    style: TextStyle(
                      color: Colors.lightBlue.shade900,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.lightBlue.shade900,
                  ),
                  title: Text(
                    'tkdanr612@gmail.com',
                    style: TextStyle(
                      color: Colors.lightBlue.shade900,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
