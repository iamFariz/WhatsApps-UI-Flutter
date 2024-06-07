import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:workshopflutter/home_page.dart';

void main() {
  Gemini.init(apiKey: "AIzaSyCBsDnzOyAkQEyPsCJIJM1DsP72_Dbjo3E");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

// // ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   var no = 15; //no = variabel integer

// // stl => , stf => widget
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }
