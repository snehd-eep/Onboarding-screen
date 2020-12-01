import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "Thinking on what to watch ?",
      "image": "assets/icons/1.svg"
    },
    {"text": "Difficult to choose.",
      "image": "assets/icons/2.svg"
    },
    {"text": "We brought you currently playing movies with trailer at one place.",
      "image": "assets/icons/3.svg"
    }

  ];



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
     child: Scaffold(
       backgroundColor: Colors.black,

       body: SizedBox(
         width: double.infinity,
         child: Column(
           children: <Widget> [

            SizedBox(
              height: size.height/20,
            ),
             Container(
               margin: EdgeInsets.all(10),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 border: Border.all(color: Colors.white),
               ),
               child: Center(
                 child: SvgPicture.asset(
                   'assets/icons/logo.svg',
                 ),
               ),
             ),

           Expanded(
             flex: 4,
             child: PageView.builder(
               onPageChanged: (value){
                 setState(() {
                   currentPage = value;
                 });
               },
               itemCount: splashData.length,
               itemBuilder: (context, index) {
                 return SplashContent(
                   text: splashData[index]["text"],
                   image: splashData[index]["image"],
                 );
               },
             ),
         ),
             Spacer(),
             
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: List.generate(splashData.length, (index) =>
                 buildDot(index: index),
               ),
             ),
             Spacer(),
             GestureDetector(
               onTap: (){

               },
               child: Container(
                 width: size.width/2,
                 padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 20),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF84D0F),
                ),
                child: Center(
                 child: Text(
                   'Continue',
                   style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold
                   ),
                 ),
               ),
               ),
             ),



             
           ]
         ),
       ),
     ),
    );
  }


AnimatedContainer buildDot({int index}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 200),
    margin: EdgeInsets.only(right: 5),
    height: 10,
    width: currentPage == index ? 20 : 10,
    decoration: BoxDecoration(
      color: currentPage == index ? Color(0xFFF84D0F) : Color(0xFFD8D8D8),
      borderRadius: BorderRadius.circular(3),
    ),
  );
}
}


class SplashContent extends StatelessWidget {

  final String text;
  final String image;
  SplashContent({this.text, this.image});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Column(
      children: [

        Spacer(),
        SvgPicture.asset(
          image,
          height: size.width/2,
          width: size.width/2,
        ),
        Spacer(),
        Container(
          width: size.width/2,
          child: Text(
            text,
            maxLines: 2,
            style: TextStyle(
                color: Colors.white,

            ),
            textAlign: TextAlign.center,
          ),
        ),


      ]

    );
  }
}





