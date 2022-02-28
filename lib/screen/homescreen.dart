import 'package:flutter/material.dart';
import 'package:wisata/widget/destinasi_kategori.dart';
import 'package:wisata/widget/list_destinasi.dart';

import '../api/api_destinasi.dart';
import '../api/api_kategori.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List listKategori = [];

  @override
  void initState() {
    getKategori().then((data) {
      setState(() {
        listKategori = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pariwisata Banjarmasin"),
          backgroundColor: Colors.redAccent,
        ),

        drawer: new Drawer(
          child: FutureBuilder<List>(
            future: getKategori(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index]['nama']),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => destinasiKategori(listKategori: listKategori[index]),
                        ));
                      },
                    );
                  },
                  );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<List>(
            future: getDestinasi(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData 
              ? new ListDestinasi(
                listDestinasi: snapshot.data,
                ) 
                : new Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
        ),
      ),
    );
  }
}