import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project1/home.dart';
import 'package:project1/reg.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var msg = '';
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 18.0);
  loginReq()async{
    String url = "https://happybuy.appsticit.com/user_login";
    Uri uri = Uri.parse(url);
    Map data = {
      'phone':_ctPhone.text,
      'password': _ctPass.text,
    };

    var jsonData = json.encode(data);

    var response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonData);

    print(response.statusCode);
    print(response.body);
    var returndata = jsonDecode(response.body);
    var status =returndata["status"];
    msg = returndata["msg"];
    if(status=="success"){
      Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (builder)=> HomePage()));
    }

    setState(() {

    });
  }
  TextEditingController _ctPhone = TextEditingController();
  TextEditingController _ctPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column
            (children: [
            SizedBox(
              height: 155.0,
              child:Text("Sing In",style:TextStyle(fontWeight: FontWeight.bold ,
                  color: Color(0xff01A0C7), fontSize: 30),),

            ),
            Container(
              child: Text('Phone Number',style: TextStyle(fontSize: 18,),),
              alignment: Alignment.topLeft,
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter your Phone Number",
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
              ),
              controller: _ctPhone,
            ),
            SizedBox(height: 25.0),
            Container(
              child: Text('Password',style: TextStyle(fontSize: 18,),),
              alignment: Alignment.topLeft,
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Enter your Password",
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
              ),
              controller: _ctPass,
            ),
            SizedBox(height: 35.0,),
            InkWell(
              onTap: (){
                loginReq();
              },
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: 100,
                color: Color(0xff01A0C7),
                child: Text("Login",textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            Text(msg),
            TextButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (builder)=> Registration()));
           }, child: Text("Create a New Account" ,style: style.copyWith(color: Color(0xff01A0C7)),))

          ],),
        ),
      ),
    );
  }
}