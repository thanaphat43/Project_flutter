import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mysql_crud/page1/PageRoom.dart';
import 'package:flutter_mysql_crud/page1/login.dart';
import 'package:flutter_mysql_crud/pageAdmin/Showuser.dart';
import 'package:flutter_mysql_crud/screens/launcher.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'details.dart';
import 'pageAdmin/newdata.dart';

void main() => runApp(MaterialApp(
      title: "Api",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Launcher(),
    ));

// void main() {
//   runApp(MyApp());
// }

// // ส่วนของ Stateless widget
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Api Test",
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       routes: {
//         '/': (context) => LoginPage(),
//         // '/่home': (context) => Launcher(),
//         '/AllowRoom': (context) => PageRoom(),
//         // '/about': (context) => About(),
//         // '/1': (context) => Mytest(),
//         // '/': (context) => Homeget(),
//       },
//     );
//   }
// }

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   Future<List> getData() async {
//     final responce = await http.get("http://192.168.1.10:3000/apistaff");
//     print(responce);
//     return jsonDecode(responce.body);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My App Bar"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (BuildContext contex) => NewData(),
//           ),
//         ),
//         child: Icon(Icons.add),
//       ),
//       body: FutureBuilder<List>(
//         future: getData(),
//         builder: (ctx, ss) {
//           if (ss.hasError) {
//             print("error");
//           }
//           if (ss.hasData) {
//             return Items(list: ss.data);
//           } else {
//             return CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }

// class Items extends StatelessWidget {
//   List list;

//   Items({this.list});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: list == null ? 0 : list.length,
//         itemBuilder: (ctx, i) {
//           return ListTile(
//             leading: Icon(Icons.message),
//             title: Text(list[i]['username']),
//             // subtitle: Text(list[i]['mobile']),
//             onTap: () => Navigator.of(context).push(MaterialPageRoute(
//               builder: (BuildContext context) => Details(list: list, index: i),
//             )),
//           );
//         });
//   }
// }
