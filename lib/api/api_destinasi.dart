import 'package:dio/dio.dart';

Future<List> getDestinasi() async{
  var dio= Dio();
  Response response = await dio.get('http://wisata.test/api/kategori');
  return response.data['data'];
}