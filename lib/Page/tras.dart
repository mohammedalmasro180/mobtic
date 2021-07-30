import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:testapk/Page/Details.dart';
import 'dart:convert' as convert;

import 'package:testapk/Widget/appbar.dart';
import 'package:testapk/Widget/prolist.dart';
import 'package:testapk/cart.dart';
import 'package:testapk/model/cart.dart';
class sent extends StatefulWidget {
  final name;
  final price;
  final cat;
  final poss;
  final cam;
  final ram;
  final img;
  sent({this.name,this.cat,this.poss,this.ram,this.price,this.cam,this.img});
  @override
  _sentState createState() => _sentState();
}

class _sentState extends State<sent> {
  @override
  Widget build(BuildContext context) {
    //
    Future getdata() async{
      var url="https://tpowep.com/storepanal/storepanal/productcat.php"
      ;
      var data={"id":widget.cat};
      var respomose=await http.post(url,body: data);
      var respomosebody=convert.jsonDecode(respomose.body);
      return respomosebody;


    }

    return Directionality(      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: myappbar(context),
          body: FutureBuilder(
              future: getdata(),
              builder:(BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(

                      itemCount: snapshot.data.length,

                      itemBuilder: (context,i) {
                        List<Item>item=[
                          Item(name: snapshot.data[i]['name'],price: double.parse('${snapshot.data[i]['price'] }'), img: snapshot.data[i]['location'],id: 1)];

                        return

                          Consumer<cart>(builder: (context,cart,chlid)
                          {
                            return

                              InkWell(
                              child: Card(
                                child: ListTile(
                                  title: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(
                                              "https://tpowep.com/storepanal/storepanal/" +
                                                  snapshot.data[i]['location'],
                                              width: 150,
                                              height: 150,

                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              snapshot.data[i]['name'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              snapshot.data[i]['price']+"\$",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: IconButton(icon: Icon(Icons.shopping_basket),onPressed: (){

                                    List<Item>item=[
                                      Item(name:
                                      snapshot.data[i]['name'],price:double.parse(snapshot.data[i]['price'],), img:  snapshot.data[i]['location'],id: 1)];
                                    cart.add(item[0]);



                                  },),

                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return Details(
                                        name: snapshot.data[i]['name'],
                                        description: snapshot
                                            .data[i]['description'],
                                        price: snapshot.data[i]['price'],
                                        img: snapshot.data[i]['location'],
                                        quantity: snapshot.data[i]['quantity'],
                                      );
                                    }));
                              },
                            );
                        }
                        );
                      });
                }
                else
                  return CircularProgressIndicator();

              }
          )
      ),
    );
  }
}
