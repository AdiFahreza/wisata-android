import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DestinasiDetail extends StatelessWidget {
  List listDestinasi;
  int index;

  DestinasiDetail({this.listDestinasi, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${listDestinasi[index]['nama']}'),
        backgroundColor: Colors.redAccent,
      ),

      body: new ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          new Image.network('${listDestinasi[index]['photo']}'),
          new Container(
            padding: const EdgeInsets.all(32.0),
            child: new Text('${listDestinasi[index]['nama']}',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(32.0),
            child: Html(
              data: listDestinasi[index]['konten'],
            ),
          )
        ],
      ),
    );
  }
}