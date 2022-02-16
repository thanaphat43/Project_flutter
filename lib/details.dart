// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mysql_crud/pageAdmin/Showuser.dart';
// import 'package:flutter_mysql_crud/pageAdmin/editdata.dart';
// import 'package:flutter_mysql_crud/main.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class Details extends StatefulWidget {
//   List list;
//   int index;

//   Details({this.list, this.index});

//   @override
//   _DetailsState createState() => _DetailsState();
// }

// class _DetailsState extends State<Details> {
//   void delete() async {
//     final response = await http.delete(
//       "http://192.168.1.10:3000/delete/'${widget.list[widget.index]['id_staff']}'",
//     );
//     if (response.statusCode == 200) {
//       return print(true);
//     } else {
//       return print(false);
//     }
//   }

//   void confirm() {
//     AlertDialog alertDialog = new AlertDialog(
//       content: Text("Are You Sure?"),
//       actions: [
//         MaterialButton(
//           child: Text("OK DELETE"),
//           onPressed: () {
//             delete();
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (BuildContext context) => Home2()));
//           },
//         ),
//         MaterialButton(
//           child: Text("CANCEL"),
//           onPressed: () {},
//         ),
//       ],
//     );
//     showDialog(builder: (context) => alertDialog, context: context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${widget.list[widget.index]['username']}'),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Text(
//               widget.list[widget.index]['username'],
//               style: TextStyle(fontSize: 20.0),
//             ),
//             Text(
//               widget.list[widget.index]['mobile'],
//             ),
//             MaterialButton(
//               child: Text("Edit"),
//               color: Colors.deepPurpleAccent,
//               onPressed: () => Navigator.of(context).push(
//                 MaterialPageRoute(
//                     // builder: (BuildContext context) =>
//                     //     Edit(list: widget.list, index: widget.index),
//                     ),
//               ),
//             ),
//             MaterialButton(
//                 child: Text("Delete"),
//                 color: Colors.deepPurpleAccent,
//                 onPressed: () {
//                   confirm();
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mysql_crud/details.dart';
import 'package:flutter_mysql_crud/page1/login.dart';
import 'package:flutter_mysql_crud/pageAdmin/newdata.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class delete extends StatefulWidget {
  List list;
  int index;

  delete({this.list, this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<delete> {
  Future<List> getData() async {
    final responce = await http.get(
        "http://192.168.1.10:3000/apistaff/${widget.list[widget.index]['id_staff']}");
    // var id =${widget.list[widget.index]['id_staff']}
    //     final id = widget.list[widget.index]['id_staff'];
    print(responce);
    return jsonDecode(responce.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App Bar"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext contex) => NewData(),
          ),
        ),
        child: Icon(Icons.add),
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
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(list[i]['username']),
            // subtitle: Text(list[i]['mobile']),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => delete(list: list, index: i),
              // builder: (BuildContext context) => delete(),
            )),
          );
        });
  }
}
