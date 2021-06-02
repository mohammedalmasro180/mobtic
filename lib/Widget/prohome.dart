import 'package:flutter/material.dart';
import 'package:testapk/Page/Details.dart';


import 'package:testapk/Page/tras.dart';
import 'package:testapk/Widget/appbar.dart';
import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

import 'package:testapk/theme/color.dart';

class homepro extends StatefulWidget {
  @override
  _homeproState createState() => _homeproState();
}

class _homeproState extends State<homepro> {

  Future getdata() async {
    var url = "https://tpowep.com/mob/api.php";
    var respomose = await http.get(url);
    var respomosebody = convert.jsonDecode(respomose.body);
    return respomosebody;
  }
    @override




  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getdata(),
        builder:(BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemCount: snapshot.data.length,

                itemBuilder: (context,i) {

                  return
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridTile(child:
                        Image.network("https://tpowep.com/mob/admin/images/"+snapshot.data[i]['iname'],),
                          footer: Container(
                              color:sh,
                              child: Text(snapshot.data[i]['mname'],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15),)),),
                      ),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return  Details(name:snapshot.data[i]['mname'],
                            poss:snapshot.data[i]['pross'],
                            ram:snapshot.data[i]['ram'],
                            cam:snapshot.data[i]['camera'],
                            price: snapshot.data[i]['price'],
                            img:snapshot.data[i]['iname'],
                          );
                        }));
                      },
                    );


                });
          }
          else
            return CircularProgressIndicator();

        }




    );
  }
}
