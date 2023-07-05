import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model_section/surah.dart';
import 'HomePageApp.dart';
import 'SurahPage.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen2> with TickerProviderStateMixin {
  List<Surah> surahList = [];
  int selectedIndex = 0;
  bool isReverse = false;
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/surah.json');
    final data = await json.decode(response);
    for (var item in data["chapters"]) {
      surahList.add(Surah.fromMap(item));
    }
    debugPrint(surahList.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text("فهرس القرآن الكريم",
          style: TextStyle(

            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        ),
        leading: IconButton(
            icon: Icon(Icons.keyboard_return),
            onPressed: () {

              final route2 = MaterialPageRoute(builder: (context) => Home_app());
              Navigator.push(context, route2);

              setState(() {
                // isReverse = !isReverse;
              });
            }),

      ),

      body: surahList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : chaptersList(isReverse ? surahList.reversed.toList() : surahList),
    );
  }

  Widget chaptersList(List<Surah> chapters) {
    return Container(
      child: ListView.separated(
        controller: _controller,
        itemBuilder: (context, index) => ListTile(

          leading: CircleAvatar(
            child: Text(chapters[index].id.toString(),   // number of surah
            style: TextStyle(fontSize: 20)
              ,),
          ),









          title: Text(chapters[index].name,style: TextStyle(
            fontSize: 20,
          ),),


          subtitle: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(chapters[index].versesCount.toString(),
            style: TextStyle(
              fontSize: 15
            )
              ,),
          ),






          trailing: Text(
            chapters[index].arabicName,
            style: TextStyle(
              fontSize: 27,
            ),

          ),


          onTap: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  SurahPage(surah: chapters[index]),
            ),
          ),
        ),
        separatorBuilder: (context, index) => Divider(height: 5,
          color: Colors.black,
          thickness: 4,
        ),
        itemCount: chapters.length,
      ),
    );
  }
}

// class GoogleFonts {
//   static cairo({required int fontSize}) {}
//
// }
