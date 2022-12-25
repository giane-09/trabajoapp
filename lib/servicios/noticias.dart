//proveedor de informacion 


import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:trabajoapp/servicios/classnoticias.dart';
import 'package:trabajoapp/servicios/classtitulares.dart';



class NoticiasApi extends ChangeNotifier {

 NoticiasApi(){
   gettitulares();
   getNoticas();
   getNoticas2();
   getNoticas3();
   getNoticas4();
   getNoticas5();
 }
List<Article> titularesHoy = [];
List<Articles> titularesAr = [];
List<Articles> titularesPortugal = [];
List<Articles> titularesCO = [];
List<Articles> titularesCuba = [];
List<Articles> titularesMexico = [];
 gettitulares()async {
  var uri = 'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=d46d0537f0f94458986785be10e72772';
  var url = Uri.parse(uri);
  final response = await http.get(url);
  final decodeData =  AbCnoticias.fromJson(response.body);
  titularesHoy = decodeData.articles;
  notifyListeners();
 }

 getNoticas()async {
  String pais='ar';
  var uri = 'https://newsapi.org/v2/top-headlines?country=$pais&apiKey=d46d0537f0f94458986785be10e72772';
  var url = Uri.parse(uri);
  final response = await http.get(url);
  final decodeData =  AbcTitulares.fromJson(response.body);
  titularesAr = decodeData.articles;
  notifyListeners();
 }


 getNoticas2()async {
  String pais='br';
  var uri = 'https://newsapi.org/v2/top-headlines?country=$pais&apiKey=d46d0537f0f94458986785be10e72772';
  var url = Uri.parse(uri);
  final response = await http.get(url);
  final decodeData =  AbcTitulares.fromJson(response.body);
  titularesPortugal = decodeData.articles;
  notifyListeners();
 }


 getNoticas3()async {
  String pais='co';
  var uri = 'https://newsapi.org/v2/top-headlines?country=$pais&apiKey=d46d0537f0f94458986785be10e72772';
  var url = Uri.parse(uri);
  final response = await http.get(url);
  final decodeData =  AbcTitulares.fromJson(response.body);
  titularesCO = decodeData.articles;
  notifyListeners();
 }


 getNoticas4()async {
  String pais='cu';
  var uri = 'https://newsapi.org/v2/top-headlines?country=$pais&apiKey=d46d0537f0f94458986785be10e72772';
  var url = Uri.parse(uri);
  final response = await http.get(url);
  final decodeData =  AbcTitulares.fromJson(response.body);
  titularesCuba = decodeData.articles;
  notifyListeners();
 }


 getNoticas5()async {
  String pais='mx';
  var uri = 'https://newsapi.org/v2/top-headlines?country=$pais&apiKey=d46d0537f0f94458986785be10e72772';
  var url = Uri.parse(uri);
  final response = await http.get(url);
  final decodeData =  AbcTitulares.fromJson(response.body);
  titularesMexico = decodeData.articles;
  notifyListeners();
 }
}

 