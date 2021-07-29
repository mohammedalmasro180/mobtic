import 'package:testapk/cart.dart';
import "package:flutter/material.dart";
import 'package:testapk/model/cart.dart';
import 'package:provider/provider.dart';

class basket extends StatefulWidget {
  const basket({Key key}) : super(key: key);

  @override
  _basketState createState() => _basketState();
}

class _basketState extends State<basket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart '),),
      body:
      Consumer<cart>(builder: (context,cart,chlid){
        return
      ListView.builder(
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
    );

          }),

    );
  }
}

