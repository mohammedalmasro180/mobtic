import 'package:flutter/material.dart';
import 'package:testapk/Page/commet.dart';

import 'package:testapk/Page/tras.dart';
import 'package:testapk/Widget/appbar.dart';
import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

import 'package:testapk/Widget/drawer.dart';
import 'package:testapk/theme/color.dart';
class postslist extends StatefulWidget {
  @override
  _postslistState createState() => _postslistState();
}

class _postslistState extends State<postslist> {
  Future getdata() async{
    var url="https://tpowep.com/storepanal/storepanal/post.php";
    var respomose=await http.get(url);
    var respomosebody=convert.jsonDecode(respomose.body);
    return respomosebody;


  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: getdata(),
        builder:(BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(

                itemCount: snapshot.data.length,


                itemBuilder: (context,i) {

                  return
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor:  sh,
                              child: Icon(Icons.perm_contact_cal,color: Colors.white,),

                            ),
                            title: Text(snapshot.data[i]['name'],style: TextStyle(color: Colors.black, fontSize: 15),),
                            subtitle: Text(snapshot.data[i]['text'],style: TextStyle(color: Colors.black, fontSize: 18),),
                          ),
                          Divider(color: rowone,),
                          Row(
                            children: [

                              Expanded(child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){

                                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                      return  comment(
                                        id: snapshot.data[i]['id'],

                                      );
                                    }));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.comment),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("تعليق",textAlign: TextAlign.center,),
                                      ),
                                      SizedBox(),

                                    ],
                                  ),
                                ),
                              )),

                            ],
                          )
                        ],
                      ),
                    );




                });
          }
          else
            return CircularProgressIndicator();

        }




    );
  }
}
