import 'package:chronify/widgets/Author.dart';
import 'package:chronify/widgets/BackPlayNextIco.dart';
import 'package:chronify/widgets/Image.dart';
import 'package:chronify/widgets/PlayTime.dart';
import 'package:chronify/widgets/Slider.dart';
import 'package:chronify/widgets/Title.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chronify',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Chronify'),
    );
  }
}

//////////////////////// HOME PAGE

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CreateImage(),
            CreateTitle(),
            CreateAuthor(),
            PlayTime(),
            CreateSlider(),
            CreateAllIcon()
          ],
        ),
      ),
    );
  }
}