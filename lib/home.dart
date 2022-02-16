import 'package:flutter/material.dart';
import 'package:flutter_mysql_crud/details.dart';
import 'package:flutter_mysql_crud/page1/PageRoom.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home1 extends StatelessWidget {
  Home1();
  Future<List> getData() async {
    final responce = await http.get("http://192.168.1.10:3000/apistaff_room");
    print(responce);
    return jsonDecode(responce.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ห้องที่สามารถเข้าถึงได้',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (ctx, ss) {
          if (ss.hasError) {
            print("error");
          }
          if (ss.hasData) {
            return Items(list: ss.data);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  List list;

  Items({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (ctx, i) {
          return Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PageRoom(list: list, index: i),
                    // builder: (BuildContext context) => delete(),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.network((list[i]['image_room']),
                          // width: 300,
                          height: 150,
                          fit: BoxFit.fill),
                    ),
                    ListTile(
                      title: Text(list[i]['room_name']),
                    ),
                  ],
                ),
              ),
            ),
          );

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 15),
          //   child: Column(
          //     children: [
          //       Container(
          //         child: Center(
          //           child: Padding(
          //             padding: const EdgeInsets.only(top: 20.0),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Center(
          //                   child: Text(
          //                     list[i]['room_name'],
          //                     // textAlign: TextAlign.center,
          //                     style:
          //                         TextStyle(color: Colors.black, fontSize: 25),
          //                   ),
          //                 ),
          //                 // SizedBox(
          //                 //   height: 10,
          //                 // ),
          //                 TextButton(
          //                   onPressed: () {
          //                     Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                         builder: (context) =>
          //                             PageRoom(list: list, index: i),
          //                         // PageRoom(),
          //                       ),
          //                     );
          //                   },
          //                   child: Image(
          //                       image: NetworkImage((list[i]['image_room'])),
          //                       height: 150,
          //                       fit: BoxFit.fill),
          //                 ),
          //                 SizedBox(
          //                   height: 10,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //         // height: 455 ,
          //         width: MediaQuery.of(context).size.width,
          //         decoration:
          //             BoxDecoration(color: Color(0xffFFFFFF), boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey,
          //             offset: Offset(0, 1),
          //           ),
          //         ]),
          //       ),
          //     ],
          //   ),
          // );
        });
  }
}
