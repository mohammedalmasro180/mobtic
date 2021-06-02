import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapk/Page/Details.dart';
import 'dart:convert' as convert;

import 'package:testapk/Widget/appbar.dart';
import 'package:testapk/Widget/prolist.dart';
class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}
var name;
var price;
var poss;
var ram;
var cam;


class _testState extends State<test> {
  Future getdata() async{
    var url="https://tpowep.com/mob/api.php";
    var respomose=await http.get(url);
    var respomosebody=convert.jsonDecode(respomose.body);
    return respomosebody;


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myappbar(context),
        body: FutureBuilder(
            future: getdata(),
            builder:(BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(

                    itemCount: snapshot.data.length,

                    itemBuilder: (context,i) {
                      name=snapshot.data[i]['mname'];
                      poss=snapshot.data[i]['pross'];
                      ram=snapshot.data[i]['ram'];
                      cam=snapshot.data[i]['camera'];

                      return InkWell(
                        child: Container(
                          height: 250,

                          width: 150,
                          child: Card(
                            child: Row(
                              children: [
                                Expanded(child:
                                Image.network("https://tpowep.com/mob/admin/images/"+snapshot.data[i]['iname'],)),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //mname


                                  children: [

                                    Text(snapshot.data[i]['mname'],style: TextStyle(fontWeight: FontWeight.w600),),
                                    Text("المواصفات",style: TextStyle(fontWeight: FontWeight.w600),),


                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text("ذاكرة"),
                                              Text(snapshot.data[i]['ram']+"G",style: TextStyle(color: Colors.deepOrange)),
                                            ],
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [

                                              Text("السعر"),
                                              Text(snapshot.data[i]['price']+"\$",style: TextStyle(color: Colors.deepOrange)),
                                            ],
                                          ),

                                        ),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text("المعالج"),
                                              Text(snapshot.data[i]['pross'],style: TextStyle(color: Colors.deepOrange)),
                                            ],
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [

                                              Text("الكاميرا"),
                                              Text(snapshot.data[i]['camera'],style: TextStyle(color: Colors.deepOrange)),
                                            ],
                                          ),

                                        ),


                                      ],
                                    ),


                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return Details(

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
