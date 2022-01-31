import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project1/log.dart';


class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 18.0);
  var msg = '';
  newUserReg() async{
    String url = "https://happybuy.appsticit.com/registration";
    Uri uri = Uri.parse(url);
    Map data = {
      'name' : _ctName.text,
      'password' : _ctPass.text,
      'phone': _ctPhone.text,
      'type':"user",
      "token":"1234",
    };

    var jsonData = json.encode(data);
    var response = await http.post(uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    print(response.statusCode);
    print(response.body);
    var returnData = jsonDecode(response.body);
    msg = returnData['msg'];

    setState(() {

    });
  }


  TextEditingController _ctName = TextEditingController();
  TextEditingController _ctPhone = TextEditingController();
  TextEditingController _ctPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 100.0,
          child:Text("Registration",style:TextStyle(fontWeight: FontWeight.bold ,
              color: Color(0xff01A0C7), fontSize: 30),),
        ),
        TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Enter your Name",
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
          ),
          controller: _ctName,
        ),
        SizedBox(height: 25.0),
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
        TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Enter your Phone Number",
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
          ),
          controller: _ctPass,
        ),
        SizedBox(height: 25.0),
        InkWell(
          onTap: (){
            newUserReg();
          },
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 150,
            color: Color(0xff01A0C7),
            child: Text("Registration", textAlign: TextAlign.center,
              style:style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),),
          ),
        ),
        Text(msg),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=> Login()));

        }, child: Text("Already Have an Account ?",style: TextStyle(color: Color(0xff01A0C7)),))

      ],),
    );
  }
}