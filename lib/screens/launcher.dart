// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// // class WeatherApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('weather App'),
// //         leading: IconButton(
// //           onPressed: () {},
// //           icon: Icon(
// //             Icons.search,
// //             size: 30,
// //             color: Colors.white,
// //           ),
// //         ),
// //       ),

// //       body: buildBody(),
// //       // bottomNavigationBar: BottomNavigationBarItem(
// //       //   items:[
// //       //     BottomNavigationBarItem(
// //       //       icon: Icon(Icon.home),
// //       //       title:  Text('home'),
// //       //       backgroundColor: Color.blue
// //       //       ),
// //       //   ]
// //       // )

// //      bottomNavigationBar: buildBottombar(),
// //     );
// //   }

// //   BottomNavigationBar buildBottombar
// //   () {
// //     return BottomNavigationBar(
// //               items:  const <BottomNavigationBarItem>[
// //                   BottomNavigationBarItem(
// //                       icon: Icon(FontAwesomeIcons.home),
// //                       label: 'Home',
// //                   ),
// //                   BottomNavigationBarItem(
// //                       icon: Icon(FontAwesomeIcons.infoCircle),
// //                       label: 'About',
// //                   ),
// //                   BottomNavigationBarItem(
// //                       icon: Icon(FontAwesomeIcons.userAlt),
// //                       label: 'Profile',
// //                   ),
// //               ],
// //               // currentIndex: _selectedIndex,
// //               // onTap: _onItemTapped,
// //           );
// //   }

//   // Container buildBody() {
//   //   return Container(
//   //  child: Stack(
//   //    children: [
//   //      Image.asset('/night.jpg',
//   //      fit: BoxFit.cover,
//   //      height: double.infinity,
//   //      width:  double.infinity,)

//   //    ],

//   //   ),

//   //   );
//   // }
// //   // Container buildBoottomNavigation() {
// //   //   return BottomNavigationBarItem(
// //   //     onItemSelected: (index) => setState(() =>index=index) ,
// //   // items: <BottomNavigationBar>[],
// //   //   );
// //   // }

// // }

// // setState(Function() param0) {
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../home.dart';
import '../page1/component/Setting.dart';
import '../page1/Proflie.dart';

class Launcher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LauncherState();
  }
}

class _LauncherState extends State<Launcher> {
  int _selectedIndex = 1;
  final List<Widget> _pageWidget = <Widget>[
    Profile(),
    Home1(),
    Setting(),
  ];
  final List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.infoCircle),
      label: 'Profile',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.cog),
      label: 'Settings',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class Launcher extends StatelessWidget {
//   Launcher();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // AppBar with automaticallyImplyLeading = "true" (Default)

//       appBar: AppBar(
//         backgroundColor: Colors.orange[900],
//         automaticallyImplyLeading: true,
//         actions: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Text("ชื่อผู้ใช้"),
//           ),
//           Icon(Icons.more_vert),
//         ],
//       ),

//       drawer: Drawer(
//         child: ListView(
//           children: const <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(color: Color(0xffCA492D)),
//               child: Text(
//                 'My logo',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 'หน้าแรก',
//                 style: TextStyle(color: Colors.black, fontSize: 25),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 'ออกแบบ',
//                 style: TextStyle(color: Colors.black, fontSize: 25),
//               ),
//             ),
//           ],
//         ),
//       ),

//       body: ListView(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(top: 60.0),
//             child: Center(
//               child: Container(
//                 width: 300,
//                 height: 80,
//                 child: Text('Room Temperature',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontFamily: 'Open Sans',
//                         color: const Color(0xffCA492D),
//                         fontSize: 32)),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             child: Card(
//               child: InkWell(
//                 splashColor: Colors.blue.withAlpha(30),
//                 onTap: () {
//                   debugPrint('Card tapped.');
//                 },
//                 child: const Image(
//                   image: AssetImage('images/weather.jpg'),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 60.0),
//             child: Center(
//               child: Container(
//                 width: 300,
//                 height: 60,
//                 child: Text('ห้องที่สามารถเข้าถึงได้',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.black, fontSize: 25)),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             child: Card(
//               child: InkWell(
//                 splashColor: Colors.blue.withAlpha(30),
//                 onTap: () {
//                   debugPrint('Card tapped.');
//                 },
//                 // child: FlatButton(
//                 //     onPressed: () {
//                 //       Navigator.push(context,
//                 //           MaterialPageRoute(builder: (_) => PageRoom()));
//                 //     },
//                     child: const Image(
//                       width: 300,
//                       height: 150,
//                       image: AssetImage('images/server_room.jpg'),
//                     )),
//               ),
            
//           ),
//           // Footer(
//           //   child: Container(
//           //       //  decoration: BoxDecoration(),
              
//           //     color: Colors.orange[900],
//           //     child: Center(
//           //       child: Text(
//           //         'room temperature',
//           //         style: TextStyle(color: Colors.white, fontSize: 25),
//           //       ),
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//           bottomNavigationBar: buildBottombar(),
//     );
//   }
//   // BoxDecoration buildBackgroud() {
//   //   return BoxDecoration(
//   //       gradient: LinearGradient(begin: Alignment.topCenter, colors: [
//   //     Colors.orange[900],
//   //     Colors.orange[800],
//   //     Colors.orange[400]
      
//   //   ]
    
//   //   ));
//   // }
//     BottomNavigationBar buildBottombar
//   () {
//     return BottomNavigationBar(
      
//               items:  const <BottomNavigationBarItem>[
//                   BottomNavigationBarItem(
               
//                       icon: Icon(FontAwesomeIcons.home
//                       ),
//                       label: 'Home',
                      

//                   ),
//                   BottomNavigationBarItem(
//                       icon: Icon(FontAwesomeIcons.infoCircle),
//                       label: 'About',
//                   ),
//                   BottomNavigationBarItem(
//                       icon: Icon(FontAwesomeIcons.userAlt),
//                       label: 'Profile',
//                   ),
//               ],
//               // currentIndex: _selectedIndex,
//               // onTap: _onItemTapped,
//           );
//   }
// }
