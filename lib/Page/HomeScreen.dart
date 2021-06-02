import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:testapk/Widget/appbar.dart';
import 'package:testapk/Widget/drawer.dart';
import 'package:testapk/Widget/homecat.dart';
import 'package:testapk/Widget/prohome.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getperf()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.getString("username");
    });

    var country = sharedPreferences.getString("key");
      print(country);

  }
  @override
  void initState() {
  getperf();
    super.initState();
  }

    @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar:myappbar(context),
        drawer:drawer(),
        body: ListView(
          children: [
            SizedBox(
              height: 350.0,
              width: double.infinity,
              child: Carousel(
                boxFit: BoxFit.cover,
                autoplay: false,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 6.0,
                dotIncreasedColor: Color(0xFFFF335C),
                dotBgColor: Colors.black,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 10.0,
                showIndicator: true,
                borderRadius: true,
                radius: Radius.circular(0),
                indicatorBgPadding: 7.0,
                images: [
                  NetworkImage('https://giveuselife.org/wp-content/uploads/2017/10/real-mobile-2x-1400x770.png'),
                  NetworkImage('https://images.indianexpress.com/2020/09/Nokia-newlaunches.jpg'),
                  NetworkImage('https://giveuselife.org/wp-content/uploads/2017/10/real-mobile-2x-1400x770.png'),
                  NetworkImage('https://images.indianexpress.com/2020/09/Nokia-newlaunches.jpg'),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text("اقسام",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
            ),
            Container(
              height: 200,
              child: homecat(),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text("اخر المنتجات",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
            ),
            Container(
              height: 400,
              child: homepro(),
            )

          ],
        ),
      ),);
  }
}
