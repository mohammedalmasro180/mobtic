import 'package:flutter/material.dart';
import 'package:testapk/Page/tras.dart';
import 'package:testapk/Widget/appbar.dart';
import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

import 'package:testapk/Widget/drawer.dart';
class Catogery extends StatefulWidget {
  @override
  _CatogeryState createState() => _CatogeryState();
}

class _CatogeryState extends State<Catogery> {
  @override
  //
  Future getdata() async{
    var url="https://tpowep.com/mob/cat.php";
    var respomose=await http.get(url);
    var respomosebody=convert.jsonDecode(respomose.body);
    return respomosebody;


  }

 Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(context),
      drawer: drawer(),
      body:FutureBuilder(
          future: getdata(),
          builder:(BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: snapshot.data.length,

                  itemBuilder: (context,i) {

                    return
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Card(
                              child: Column(
                                children: [
                                  Expanded(child:
                                  Image.network("https://tpowep.com/mob/admin/images/"+snapshot.data[i]['image'],)
                                  ),

                                  Text(snapshot.data[i]['cname'])

                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return sent(
                              cat:snapshot.data[i]['cname'],
                            );
                          }));
                        },
                      );


                  });
            }
            else
              return CircularProgressIndicator();

          }




      )
    );

  }
}
