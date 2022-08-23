import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './question.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomeState();
  }
}

class _MyHomeState extends State<MyHomePage> {
  int _questionIndex = 0;

  var questions = [
    "What is your favourite color?",
    "What is your favourite animal?"
  ];

  void _answerQuestion() {
    if (_questionIndex < questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My first app")),
        body: Column(children: <Widget>[
          Question(questions[_questionIndex]),
          ElevatedButton(
            child: Text("Answer 1"),
            onPressed: _answerQuestion,
          ),
          ElevatedButton(
            child: Text("Answer 2"),
            onPressed: _answerQuestion,
          ),
          ElevatedButton(
            child: Text("Answer 3"),
            onPressed: _answerQuestion,
          ),
        ]),
      ),
    );
  }
}
