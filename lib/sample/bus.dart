// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:intl/intl.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           // This is the theme of your application.
//           //
//           // Try running your application with "flutter run". You'll see the
//           // application has a blue toolbar. Then, without quitting the app, try
//           // changing the primarySwatch below to Colors.green and then invoke
//           // "hot reload" (press "r" in the console where you ran "flutter run",
//           // or simply save your changes to "hot reload" in a Flutter IDE).
//           // Notice that the counter didn't reset back to zero; the application
//           // is not restarted.
//           primarySwatch: Colors.blue,
//           fontFamily: 'Roboto'),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.

//     DateTime now = DateTime.now();
//     String curTime = DateFormat('kk:mm:ss').format(now);
//     Timer(const Duration(seconds: 1), () {
//       setState(() {
//         curTime = DateFormat('kk:mm:ss').format(now);
//       });
//     });

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: 113,
//               color: Colors.indigo[800],
//               child: Stack(
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                           ' One - All Zones Plus Network One - All Zones Plus Network One',
//                           style: TextStyle(
//                               color: Colors.white.withOpacity(0.1),
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600)),
//                       const SizedBox(height: 5),
//                       Text(
//                           'All Zones Plus Network One - All Zones Plus Network One - All Zo',
//                           style: TextStyle(
//                               color: Colors.white.withOpacity(0.1),
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600)),
//                       const SizedBox(height: 5),
//                       Text(
//                           ' One - All Zones Plus Network One - All Zones Plus Network One',
//                           style: TextStyle(
//                               color: Colors.white.withOpacity(0.1),
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600)),
//                       const SizedBox(height: 5),
//                       Text(
//                           'All Zones Plus Network One - All Zones Plus Network One - All Zo',
//                           style: TextStyle(
//                               color: Colors.white.withOpacity(0.1),
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600)),
//                       const SizedBox(height: 5),
//                       Text(
//                           ' One - All Zones Plus Network One - All Zones Plus Network One',
//                           style: TextStyle(
//                               color: Colors.white.withOpacity(0.1),
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600)),
//                       const SizedBox(height: 5),
//                       Text(
//                           'All Zones Plus Network One - All Zones Plus Network One - All Zo',
//                           style: TextStyle(
//                               color: Colors.white.withOpacity(0.1),
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600)),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Column(
//                         children: const [
//                           SizedBox(height: 40),
//                           Text('Network One - All\nZones Plus',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 26,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.white)),
//                         ],
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 40),
//             QrImage(
//               data:
//                   '8,3,49,8a046b5e-e5bf-445a-86ba-a7e140d7280b,637f5dd74197c58eef0ca098,AZP7,18a87830,,159,18a60ddb,0,N7qLEAeH5hOTEpESsZBvVh3beLwX23oqrFsBwdWe1rjBBPy7/uOq7kPaxsd8eFpcvFYEpfrrLbMBSv2+/P2dx1T9vtinAJ46wuPPbIgc1kVjTGdKI2AjeTQHIEzneX8taaR+9Jtuq3s51kPQFD4XI1dt4XNA4MSC3b1AlC5HoiDRwD5MzHIFG8/cz7kxlfAtuvh1/O9EuarizdeHMTMsD0Ejy/timF70uzVOY3Bf1guaBxO/iCrxYr8y/wxsKW8jq3hbWb8e2w+KVHBITOsR3mmiSrS0yjjhkIToQutSxhKz9k/iVaf44HxLYnKluT1bgXW4QaHkEqn8Mpm7LohPNg==,NlBnWe+wQzRQnZnwVfLUDyBiVrc=,1,189f60a1',
//               version: QrVersions.auto,
//               size: 240.0,
//             ),
//             const SizedBox(height: 40),
//             const Text('koala',
//                 style: TextStyle(fontSize: 54, fontWeight: FontWeight.w600)),
//             const SizedBox(height: 20),
//             Text(curTime,
//                 style:
//                     const TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
//             const SizedBox(height: 20),
//             const Divider(),
//             const SizedBox(height: 10),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: const [
//                     Text('01',
//                         style: TextStyle(
//                             fontSize: 28, fontWeight: FontWeight.w600)),
//                     Text('days', style: TextStyle(fontSize: 14)),
//                   ],
//                 ),
//                 const SizedBox(width: 10),
//                 const Text(':',
//                     style:
//                         TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
//                 const SizedBox(width: 10),
//                 Column(
//                   children: const [
//                     Text('18',
//                         style: TextStyle(
//                             fontSize: 28, fontWeight: FontWeight.w600)),
//                     Text('hrs', style: TextStyle(fontSize: 14)),
//                   ],
//                 ),
//                 const SizedBox(width: 10),
//                 const Text(':',
//                     style:
//                         TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
//                 const SizedBox(width: 10),
//                 Column(
//                   children: const [
//                     Text('30',
//                         style: TextStyle(
//                             fontSize: 28, fontWeight: FontWeight.w600)),
//                     Text('mins', style: TextStyle(fontSize: 14)),
//                   ],
//                 ),
//                 const SizedBox(width: 10),
//                 const Text(':',
//                     style:
//                         TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
//                 const SizedBox(width: 10),
//                 Column(
//                   children: const [
//                     Text('12',
//                         style: TextStyle(
//                             fontSize: 28, fontWeight: FontWeight.w600)),
//                     Text('seconds', style: TextStyle(fontSize: 14)),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             const Divider(),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text('Network One - 7 Day All Zones Plus',
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//                   SizedBox(height: 10),
//                   Text(
//                       'Unlimited travel accross CountyDurham, Northumberland and Tyne & Wear on buses, Metro, Shields Ferry and the Sunderland to Blaydon train line',
//                       style: TextStyle(fontSize: 14)),
//                   SizedBox(height: 10),
//                   Text('Expires 03:00, Fri 10th Feb',
//                       style: TextStyle(fontSize: 14)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
