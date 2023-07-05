

import 'package:flutter/material.dart';

import 'home_page.dart';

class Home_app extends StatelessWidget {
  const Home_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Center(child: Text("قرآنك حياتك",
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),)),
          ),
          Text("[ زينوا القرآن بأصواتكم ]",
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),),

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(40),
              ),
              // decoration: BoxDecoration(
              //   //borderRadius: BorderRadius.circular(20)
              // ),
              

              child: ListTile(
                title: Text("    هل يجوز قراءة القرآن للتعبد بدون وضوء ؟        ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),

                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 35, top: 15),
                  child: Text(" يجوز قراءة القرآن بدون وضوء، إذا كان القارئ حافظا للقرآن أو لجزء منه ويتلوه بغير مس للمصحف، أما من أراد قراءة النص المكتوب فيمكنه الاستعانة بالأدوات الحديثة كالمصاحف الموجودة علي الهاتف المحمول ونحوها",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),

                  ),
                ),

              ),
            ),
          ),

          ElevatedButton(
            child: Text("أبدا القراءة"),
              style: ElevatedButton.styleFrom(
                 textStyle: TextStyle(
                   fontSize: 30,
                 ),
                  primary: Colors.green, //background color of button
                  side: BorderSide(width:3, color:Colors.brown), //border width and color
                  //elevation: 3, //elevation of button
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30),
                  ),

              ), onPressed: ()
          {
            final route = MaterialPageRoute(builder: (context) => HomeScreen2());
            Navigator.push(context, route);


          },
          )

        ],
      ),
    );
  }
}
