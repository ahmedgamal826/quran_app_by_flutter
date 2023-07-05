

import 'package:flutter/material.dart';

import 'Screens/HomePageApp.dart';
import 'Screens/home_page.dart';

void main() {
  runApp(Quran_app());
}

class Quran_app extends StatelessWidget {
  const Quran_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "القرآن الكريم",
        theme: ThemeData(
          primaryColor: Colors.cyanAccent,
        ),
      home: Home_app()



    );
  }
}



