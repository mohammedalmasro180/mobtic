import 'package:flutter/material.dart';
import 'package:testapk/Page/commet.dart';

import 'package:testapk/Page/tras.dart';
import 'package:testapk/Widget/appbar.dart';
import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

import 'package:testapk/Widget/drawer.dart';
import 'package:testapk/Widget/posts.dart';
import 'package:testapk/theme/color.dart';
class tester extends StatefulWidget {
  @override
  _testerState createState() => _testerState();
}

class _testerState extends State<tester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(context),
      body: postslist(),
    );
  }
}
