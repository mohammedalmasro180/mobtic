
import 'package:flutter/material.dart';
import 'package:testapk/Page/HomeScreen.dart';
import 'package:testapk/Page/Login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:testapk/Page/loginpage.dart';
import 'package:testapk/Widget/appbar.dart';
import 'package:testapk/theme/color.dart';
class singup extends StatefulWidget {
  @override
  _singupState createState() => _singupState();
}
TextEditingController phone=new TextEditingController();
TextEditingController username=new TextEditingController();
TextEditingController password=new TextEditingController();
TextEditingController name=new TextEditingController();


GlobalKey<FormState> formstate=new GlobalKey();
class _singupState extends State<singup> {

  @override


  Widget build(BuildContext context) {


    bool selected = false;
    var mdw=MediaQuery.of(context).size.width;
    var mhw=MediaQuery.of(context).size.height;

    return         Scaffold(

      appBar: myappbar(context),
      body:

           Directionality(      textDirection: TextDirection.rtl,

            child: Stack(
             children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,

                ),

                Positioned(child: Transform.scale(
                  scale: 1.3,
                  child: Transform.translate(
                    offset: Offset(0,-200),
                    child: Container(
                      //color: Colors.lime,
                      height: mdw,
                      width: mdw,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(mdw),
                          color: rowone




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
                        color: rowto.withOpacity(0.5)




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
                            child: Text("انشاء حساب جديد",style: TextStyle(fontSize: 20,color: Colors.white),))
                        ),
                        Padding(padding: EdgeInsets.only(top: 80),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: sh,
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
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: Container(

                              padding: EdgeInsets.all(30),
                              height: 550,
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
                                          child: bulidtextfield("الاسم",  name,validuser)
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: bulidtextfield("البريد الالكتروني", username,validuser)
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            validator: validpass,
                                            controller: password,
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
                                          ),                                          ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: bulidtextfield("الهاتف",phone,validuser)
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(

                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  Container(


                                    child: Text("  لدي حساب ",style: TextStyle(fontSize: 20,color: sh)),

                                  ),
                                  InkWell(
                                    child:  Text("تسجيل دخول  "
                                        ,style: TextStyle(fontSize: 20,color: rowto)),
                                      //

                                    onTap: (){
                                      Navigator.pushReplacement(
                                          context, MaterialPageRoute(builder: (context) =>loginui()));

                                    },

                                  )

                                ],
                              ),
                            ),

                            Container(
                                color: sh,


                                margin: EdgeInsets.only(top: 20),
                                child:RaisedButton

                                  (

                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                                  onPressed:(){
                                    signup();

                                    Navigator.pushReplacement(
                                        context, MaterialPageRoute(builder: (context) => HomeScreen()));

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

String validuser(String val){
  if (val.isEmpty)
    return "الرجاء ادخال الحقل";

  if (val.trim().length<5)
    return "اسم المستخدم اطول من 5 احرف";


  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);


}
String validpass(String val){
  if (val.isEmpty)
    return "الرجاء ادخال الحقل";

  if (val.trim().length<5)
    return "كلمة المرور اطول من 5 احرف";

}

String confirempass(String val){
  if (val.isEmpty)
    return "الرجاء ادخال الحقل";

  if (val.trim().length<5)
    return "كلمة المرور اطول من 5 احرف";



  }
signup() async {
  var fromdata = formstate.currentState;
  if (fromdata.validate()) {
    fromdata.save();
    var data = {
      "username": username.text,
      "password": password.text,
      "name": name.text,
      "phone": phone.text
    };
    var url = "https://tpowep.com/mob/signup.php";
    var reesponse = await http.post(url, body: data);
    var responsebody = jsonDecode(reesponse.body);
  }
}