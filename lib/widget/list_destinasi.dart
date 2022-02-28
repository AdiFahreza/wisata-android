import 'package:flutter/material.dart';
import 'package:wisata/widget/destinasi_detail.dart';

class ListDestinasi extends StatelessWidget{
  final List listDestinasi;
  ListDestinasi({this.listDestinasi});

  Widget build(BuildContext context) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listDestinasi == null ? 0 : listDestinasi.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => 
              DestinasiDetail (listDestinasi: listDestinasi, index: index)
              ));
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: new Card(
              child: new ListTile(
                leading: Image.network(
                  listDestinasi[index]['photo'],
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: new Text(
                  listDestinasi[index]['nama'],
                  style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87
                  ),
                ),
                subtitle: Text(
                  "${listDestinasi[index]['kategori']} | ${listDestinasi[index]['wilayah']}",
                ),
              ),
            ),
          ),
        );
      });
  }
}