import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mysql_crud/main.dart';
import 'package:flutter_mysql_crud/pageAdmin/Showuser.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewData extends StatefulWidget {
  @override
  _NewDataState createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController image_staff = new TextEditingController();
  TextEditingController staff_room = new TextEditingController();
  void addData() {
    var url = "http://192.168.1.10:3000/adduser";
    http.post(url, body: {
      "username": username.text,
      "password": password.text,
      "image_staff": password.text,
      "staff_room": password.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Data"),
      ),
      body: ListView(
        children: [
          TextField(
            controller: username,
            decoration: InputDecoration(
                hintText: "Enter Name", labelText: "Enter Name"),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
                hintText: "Enter Mobile", labelText: "Enter Moblile"),
          ),
          MaterialButton(
            child: Text("Add Data"),
            color: Colors.red,
            onPressed: () {
              addData();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => Home2()),
              );
            },
          ),
        ],
      ),
    );
  }
}
