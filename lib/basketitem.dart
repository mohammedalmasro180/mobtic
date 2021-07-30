import 'dart:convert';

import 'package:testapk/cart.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;


import "package:flutter/material.dart";
import 'package:testapk/model/cart.dart';
import 'package:provider/provider.dart';
import 'package:testapk/theme/color.dart';

class basket extends StatefulWidget {
  const basket({Key key}) : super(key: key);

  @override
  _basketState createState() => _basketState();
}

class _basketState extends State<basket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
      Consumer<cart>(builder: (context,cart,chlid)
      {
        return Text(cart.total.toString()+" \$");
      }


    ),
      actions: [
    Consumer<cart>(builder: (context,cart,chlid)
    {
return   Padding(

            padding: const EdgeInsets.all(8.0),
            child: RaisedButton (
                color: sh,

                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                onPressed: (

                    )  async {

                  SharedPreferences preferences=await SharedPreferences.getInstance();
                  String username=  preferences.getString("username");
                  for(int i=0;i<cart.basketitem.length;i++){
                    var data = {
                      "name": cart.basketitem[i].name,
                      "img":cart.basketitem[i].img,
                      "user": "username74532",
                      "price": cart.basketitem[i].price.toString(),
                    };

                    var url = "https://tpowep.com/storepanal/storepanal/orderss.php";
                    var reesponse = await http.post(url, body: data);
                    var responsebody = jsonDecode(reesponse.body);
                  }              },




                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Checkout",
                      style: TextStyle(color: Colors.white),),
                    Icon(Icons.arrow_forward, color: primary,
                    )
                  ],
                )

            )
        );
    }


    ),
      ],
      ),
      body:
      Consumer<cart>(builder: (context,cart,chlid){
        return
      Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: cart.basketitem.length,
                itemBuilder: (context,i){
                  return Card(
                      child:



                          ListTile(
                            title: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        "https://tpowep.com/storepanal/storepanal/" +
                                         cart.basketitem[i].img,
                                        width: 150,
                                        height: 150,
                                      ),
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('${cart.basketitem[i].name}'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('${cart.basketitem[i].price}'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: IconButton(icon: Icon(Icons.close_rounded),onPressed: (){
                              cart.remove(cart.basketitem[i]);

                            },),
                ),
     );
    }
    ),
          ),

        ],
      );

          }
          ),

    );
  }
}

