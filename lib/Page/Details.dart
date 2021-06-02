import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:testapk/Widget/appbar.dart';
import 'package:testapk/Widget/drawer.dart';
import 'package:testapk/theme/color.dart';
class Details extends StatefulWidget {
  final name;
  final price;
  final poss;
  final cam;
  final img;
  final ram;
  Details({this.name,this.poss,this.ram,this.price,this.cam,this.img});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    return Directionality(      textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: myappbar(context),
          drawer: drawer(),
          body: ListView(
            children: [
              Container(
                height: 300,
                child: GridTile(
                  child: Image.network("https://tpowep.com/mob/admin/images/"+widget.img,),
                  footer: Container(
                    height: 50,
                    alignment: Alignment.center,
                    color:sh,
                    child: Row(
                      children: [
                        Expanded(child: Text(widget.name.toString(),style: TextStyle(fontSize: 20,color: Colors.white),)),

                        Directionality(      textDirection: TextDirection.ltr,
                            child: Expanded(child: Text(widget.price.toString()+"\$",style: TextStyle(fontSize: 20,color: Colors.white),))),

                      ],
                    ),

                  ),
                ),
              ),
              Container(
                child: Text("المواصفات",style: TextStyle(fontSize: 20),),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          color:rowone,
                          child:
                          RichText(
                            text: TextSpan(


                              children: <TextSpan>[
                                TextSpan(text:"المعالج  ",style: TextStyle(fontSize: 20,color: coltes),),
                                TextSpan(text:widget.poss,style: TextStyle(fontSize: 20,color: coltes),),
                              ],
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),

                          color:rowone,
                          child:
                          RichText(
                            text: TextSpan(


                              children: <TextSpan>[
                                TextSpan(text:"الذاكرة  ",style: TextStyle(fontSize: 20,color: coltes),),
                                TextSpan(text:widget.ram,style: TextStyle(fontSize: 20,color: coltes),),
                              ],
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          color:rowone,
                          child:
                          RichText(
                            text: TextSpan(


                              children: <TextSpan>[
                                TextSpan(text:" الكاميرا",style: TextStyle(fontSize: 20,color: coltes),),
                                TextSpan(text:" "+widget.cam,style: TextStyle(fontSize: 20,color: coltes),),
                              ],
                            ),
                          )
                      ),
                    ),



                  ],
                ),
              )


            ],
          ),

        )
    );
  }
}
