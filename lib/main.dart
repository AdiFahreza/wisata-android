import 'package:flutter/material.dart';
import 'package:wisata/screen/homescreen.dart';

void main(){
  runApp(WisataApp());
}

class WisataApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Banjarmasin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

//coded by Adi Fahreza