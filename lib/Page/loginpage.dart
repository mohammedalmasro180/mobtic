import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapk/Page/Catogery.dart';
import 'package:testapk/Page/HomeScreen.dart';
import 'package:testapk/Page/signup.dart';
import 'package:testapk/Widget/appbar.dart';
import 'package:testapk/theme/color.dart';
class loginui extends StatefulWidget {
  @override
  _loginuiState createState() => _loginuiState();
}

class _loginuiState extends State<loginui> {
  GlobalKey<FormState> formstate=new GlobalKey();
  bool selected = false;
  TextEditingController phone = new TextEditingController ();
  TextEditingController username = new TextEditingController ();
  TextEditingController password = new TextEditingController ();
  TextEditingController name;
  bool liading=false;
  String validuser(String val) {
    if (val.isEmpty)
      return "الرجاء ادخال الحقل";


    if (val
        .trim()
        .length < 5)
      return "اسم المستخدم اطول من 5 احرف";
  }

  String validpass(String val) {
    if (val.isEmpty)
      return "الرجاء ادخال الحقل";

    if (val
        .trim()
        .length < 5)
      return "كلمة المرور اطول من 5 احرف";
  }

  String confirempass(String val) {
    if (val.isEmpty)
      return "الرجاء ادخال الحقل";

    if (val.trim()
        .length < 5)
      return "كلمة المرور اطول من 5 احرف";
  }


  var ed;
  signup() async {
    var fromdata = formstate.currentState;
    if (fromdata.validate()) {
      fromdata.save();
      setState(() {
        liading=true;
      });
      var data = {"username": username.text, "password": password.text};
      var url = "https://tpowep.com/mob/logincode.php";
      var reesponse = await http.post(url, body: data);
      var responsebody = jsonDecode(reesponse.body);
      ed=responsebody;
      print(reesponse.body);

    }

    else {
      setState(() {
        liading=false;
      });
      
    }
  }





  @override
  Widget build(BuildContext context) {
    setState(() {
      saveperf(username.text);
    });
    password.text="pass212212";
    username.text="user@tpowep.com";

    var mdw=MediaQuery.of(context).size.width;

    return        Scaffold(
      appBar: myappbar(context),
      body:  Directionality(      textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,

            ),
            Positioned(child: Transform.scale(
              scale: 1.3,
              child: Transform.translate(
                offset: Offset(0,-300),
                child: Container(
                  //color: Colors.lime,
                  height: mdw,
                  width: mdw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(mdw),
                      color: sh




                  ),
                ),
              ),
            )),
            Positioned(
              top: 300,
              right: mdw/2,
              child:
              Container(
                //color: Colors.lime,
                height: mdw,
                width: mdw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mdw),
                    color: sh.withOpacity(0.5)




                ),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(child:
                    Container(


                        margin: EdgeInsets.only(top: 120),
                        child: Text("تسجيل الدخول",style: TextStyle(fontSize: 20,color: Colors.white),))
                    ),
                    Padding(padding: EdgeInsets.only(top: 80),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.amber,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 4,
                                  spreadRadius: 0.1
                              )
                            ]


                        ),
                        child:Stack(

                          children: [
                            Positioned(
                              right: 25,
                              top: 25,
                              child:  Icon(Icons.person,size: 50,color: Colors.white,),)
                          ],
                        ),

                      ),),
                    Padding(
                      padding: const EdgeInsets.all(55),
                      child: Center(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 600),
                          padding: EdgeInsets.all(30),
                          height: 350,
                          width: mdw/1.2,

                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Form(
                                  key: formstate,
                                  child: Center(
                                    child: Column(

                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            //               autovalidate: true,
                                            controller: username,
                                            validator: validuser,
                                            decoration: InputDecoration(labelText: "الاسم",filled: true,fillColor: Colors.white,icon: Icon(Icons.perm_contact_cal,size: 25,color:sh,),border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20)
                                            )),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: password,
                                            //                      validator: validpass,
                                            obscureText: true,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                labelText: "كلمة المرور",
                                                filled: true,


                                                fillColor: Colors.white,


                                                icon: Icon(Icons.perm_contact_cal,size: 25,color:sh,),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(20)
                                                )),
                                          ),
                                        ),


                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 4,
                                    spreadRadius: 0.1
                                )
                              ]

                          ),

                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(


                            margin: EdgeInsets.only(top: 20),
                            child: Text("هل نسيت كلمة المرور؟",style: TextStyle(fontSize: 20,color: sh),)
                        ),
                        Container(



                            margin: EdgeInsets.only(top: 20),
                            child:RaisedButton(
                              color: rowto,
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                              onPressed:() {
                                signup();
                                saveperf(username.text);
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                              },

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("تسجيل الدخول",style: TextStyle(color:Colors.white),),
                                  Icon(Icons.arrow_forward,color: Colors.white,
                                  )
                                ],
                              ),
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              Container(


                                child: Text("  ليس لدي حساب انشاء",style: TextStyle(fontSize: 20,color: sh)),

                              ),
                              InkWell(
                                child:  Text("حساب جديد  "
                                    ,style: TextStyle(fontSize: 20,color: rowto)),

                                onTap: (){
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context) =>singup()));

                                },

                              )

                            ],
                          ),

                        ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50,right: 50),
                            child: Row(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Expanded(child:
                                  RaisedButton(
                                    color:rowone,
                                    onPressed: () {  },
                                    child: Row(

                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset("img/g.png",width: 25,height: 25,),
                                        ),
                                        Text("تسجيل الدخول مع جوجل")
                                      ],
                                    ),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Expanded(child:
                                  RaisedButton(
                                    color:sh,
                                    onPressed: () {  },
                                    child: Row(

                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset("img/f.png",width: 25,height: 25,),
                                        ),
                                        Text("تسجيل الدخول مع فيسبوك")
                                      ],
                                    ),
                                  )),
                                ),

                              ],
                            ),
                          ),


                      ],
                    ),

                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

TextFormField bulidtextfield(String hint,TextEditingController Controller,myvalid)
{
  return TextFormField(

    validator: myvalid,
    controller: Controller,
    decoration: InputDecoration(labelText: hint,filled: true,fillColor: Colors.white,icon: Icon(Icons.perm_contact_cal,size: 25,color:sh,),border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
    )),
  );
}
saveperf(String username)async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setString("username", username);
  print(sharedPreferences.get("username"));

}
