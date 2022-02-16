// '{\"ok\":false,\"message\":\"username , password ผิดพลาด!\"}'
import 'dart:convert';

import 'package:art_sweetalert/art_sweetalert.dart';
// import 'package:fl_line_chart_example/pageAdmin/adminSetting.dart';
// import 'package:fl_line_chart_example/screens/launcher.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mysql_crud/pageAdmin/adminSetting.dart';
import 'package:http/http.dart' as http;
//import http package manually

class LoginPageAdmin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPageAdmin> {
  String errormsg;
  bool error, showprogress;
  String username, password;

  var _username = TextEditingController();
  var _password = TextEditingController();

  startLogin() async {
    String apiurl = "http://192.168.1.10:3000/login";

    print(username);

    var response = await http.post(Uri.parse(apiurl), body: {
      'username': username, //get the username text
      'password': password //get password text
    });

    if (response.statusCode == 200) {
      // var jsondata = json.decode(response.body);
      var jsondata = await json.decode(json.encode(response.body));

      print(jsondata);
      if (jsondata != '{"access_lavel":"No"}') {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => adminSetting(),
            ),
          );
        });
      } else {
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.danger,
              title: "Username หรือ Password ผิดค่ะ",
            ));
      }
    }
  }

  @override
  void initState() {
    username = "";
    password = "";
    errormsg = "";
    error = false;
    showprogress = false;

    //_username.text = "defaulttext";
    //_password.text = "defaultpassword";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent
            //color set to transperent or set your own color
            ));

    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: 80,
            height: 800,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://media.nationalgeographic.org/assets/photos/000/269/26964.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              //สร้าง Child ซึ่งเป็นcloumn
              children: <Widget>[
                //สร้าง childen สำหรับ widget
                Padding(
                  //สร้างpadding
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Container(
                    // สร้าง  Container เพื่อกำหนดขอบเขต
                    width: 300,
                    height: 200,

                    child: Text('Room Temperature Admin',
                        // textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _username,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Enter valid Username '),
                    onChanged: (value) {
                      //set username  text on change
                      username = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                    onChanged: (value) {
                      // change password text
                      password = value;
                    },
                  ),
                ),
                Container(
                  width: 250,
                  height: 100,
                  child: FlatButton(
                    onPressed: () {
                      //TODO FORGOT PASSWORD SCREEN GOES HERE
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          //show progress indicator on click
                          showprogress = true;
                        });
                        startLogin();
                      },
                      child: showprogress
                          ? SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.orange[100],
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.deepOrangeAccent),
                              ),
                            )
                          : Text(
                              "LOGIN NOW",
                              style: TextStyle(fontSize: 20),
                            ),
                      // if showprogress == true then show progress indicator
                      // else show "LOGIN NOW" text
                      colorBrightness: Brightness.dark,
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                          //button corner radius
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 130,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration myInputDecoration({String label, IconData icon}) {
    return InputDecoration(
      hintText: label, //show label as placeholder
      hintStyle:
          TextStyle(color: Colors.orange[100], fontSize: 20), //hint text style
      prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Icon(
            icon,
            color: Colors.orange[100],
          )
          //padding and icon for prefix
          ),

      contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
              color: Colors.orange[300], width: 1)), //default border of input

      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:
              BorderSide(color: Colors.orange[200], width: 1)), //focus border

      fillColor: Color.fromRGBO(251, 140, 0, 0.5),
      filled: true, //set true if you want to show input background
    );
  }

  Widget errmsg(String text) {
    //error message widget.
    return Container(
      padding: EdgeInsets.all(15.00),
      margin: EdgeInsets.only(bottom: 10.00),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.red,
          border: Border.all(color: Colors.red[300], width: 2)),
      child: Row(children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 6.00),
          child: Icon(Icons.info, color: Colors.white),
        ), // icon for error message

        Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
        //show error message text
      ]),
    );
  }
}
