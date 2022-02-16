// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Profile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Column(
//         children: [
//           Container(
//             child: Container(
//               width: double.infinity,
//               height: 200,
//               child: Container(
//                 width: double.infinity,
//                 height: 200,
//                 alignment: Alignment(0.0, 2.5),
//                 child: CircleAvatar(
//                   backgroundImage: NetworkImage(
//                       "https://scontent.fbkk7-2.fna.fbcdn.net/v/t1.6435-9/50623534_2293533630887751_7427215429472354304_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=84a396&_nc_eui2=AeG0WZTsrIOnmAMGXejdD_kdRqDl76-9Gd5GoOXvr70Z3mxOGRU_B8KQxlIB6eI-GAUlclNHB7I2H24HpaGPO2qN&_nc_ohc=5AAf2JBX6kMAX9MQElI&_nc_ht=scontent.fbkk7-2.fna&oh=00_AT_yqqShVoDbgO0CI-0VrUidTANbk9YGVTpvVEfqUpJTmQ&oe=6212AFA9"),
//                   radius: 60.0,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 100,
//           ),
//           Text(
//             "Thanaphat  Pinthong",
//             style: TextStyle(
//                 fontSize: 25.0,
//                 color: Colors.blueGrey,
//                 letterSpacing: 2.0,
//                 fontWeight: FontWeight.w400),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Text(
//             "ตำแหน่ง",
//             style: TextStyle(
//                 fontSize: 18.0,
//                 color: Colors.black45,
//                 letterSpacing: 2.0,
//                 fontWeight: FontWeight.w300),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Text(
//             "นักศึกษาฝึกงาน",
//             style: TextStyle(
//                 fontSize: 15.0,
//                 color: Colors.black45,
//                 letterSpacing: 2.0,
//                 fontWeight: FontWeight.w300),
//           ),
//         ],
//       ),
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  Text(
                    'Profile Staff',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'Nisebuschgardens',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.55,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.70,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                    ),
                                    Text(
                                      'Thanaphat   Pinthong ',
                                      style: TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        fontFamily: 'Nunito',
                                        fontSize: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'ตำแหน่ง',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontFamily: 'Nunito',
                                            fontSize: 25,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'นักศึกษาฝึกงาน',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontFamily: 'Nunito',
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://scontent.fbkk7-2.fna.fbcdn.net/v/t1.6435-9/50623534_2293533630887751_7427215429472354304_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=84a396&_nc_eui2=AeG0WZTsrIOnmAMGXejdD_kdRqDl76-9Gd5GoOXvr70Z3mxOGRU_B8KQxlIB6eI-GAUlclNHB7I2H24HpaGPO2qN&_nc_ohc=5AAf2JBX6kMAX9MQElI&_nc_ht=scontent.fbkk7-2.fna&oh=00_AT_yqqShVoDbgO0CI-0VrUidTANbk9YGVTpvVEfqUpJTmQ&oe=6212AFA9"),
                                  radius: 60.0,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   height: height * 0.5,
                  //   width: width,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(30),
                  //     color: Colors.white,
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
