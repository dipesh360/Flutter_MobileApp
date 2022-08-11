import 'package:flutter/material.dart';

void main() {
  runApp(MyErrorPAge());
}

class MyErrorPAge extends StatelessWidget {
  const MyErrorPAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ErrorPage());
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mobile App"),
        ),
        body: Center(
            child: Text("Invalid Mobile no...",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'poppins',
                ))));
  }
}
