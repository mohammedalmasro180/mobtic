import 'dart:convert';

import 'package:testapk/Widget/drawer.dart';
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
    return Directionality(      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: drawer(),
        appBar: AppBar(title:
        Consumer<cart>(builder: (context,cart,chlid)
        {
          return Text(cart.total.toString()+" \$");
        }


      ),
        backgroundColor: primary,
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
                    if(username!=null) {
                      for (int i = 0; i < cart.basketitem.length; i++) {
                        var data = {
                          "name": cart.basketitem[i].name,
                          "img": cart.basketitem[i].img,
                          "user": username.toString(),
                          "price": cart.basketitem[i].price.toString(),
                        };

                        var url = "https://tpowep.com/storepanal/storepanal/orderss.php";
                        var reesponse = await http.post(url, body: data);
                        var responsebody = jsonDecode(reesponse.body);
                      }
                    }
                    else
                      _showMyDialog(context);
                    },




                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Checkout",
                        style: TextStyle(color: coltes),),
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

      ),
    );
  }
}


Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('تسجيل دخول'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('الرجاء تسجيل الدخول'),

            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}