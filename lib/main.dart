import 'package:carousel_pro/carousel_pro.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapk/Page/Catogery.dart';
import 'package:testapk/Page/Details.dart';
import 'package:testapk/Page/HomeScreen.dart';
import 'package:testapk/Page/Login.dart';
import 'package:testapk/Page/commet.dart';
import 'package:testapk/Page/loginn.dart';
import 'package:testapk/Page/loginpage.dart';
import 'package:testapk/Page/posts.dart';
import 'package:testapk/Page/shered.dart';
import 'package:testapk/Page/signup.dart';
import 'package:testapk/Page/test.dart';
import 'package:testapk/Page/tras.dart';
import 'package:testapk/Widget/prolist.dart';
import 'package:testapk/Widget/serash.dart';
import 'package:testapk/cart.dart';
import 'Page/samsung.dart';



void main() {  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> cart(),





    child: MaterialApp(

    debugShowCheckedModeBanner: false,
      title: 'HiTic',
        theme: ThemeData(fontFamily: 'Neo'),
      home: HomeScreen()

    ),
    );

  }
}
