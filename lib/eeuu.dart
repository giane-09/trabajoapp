import 'package:flutter/material.dart';
import 'package:trabajoapp/servicios/classnoticias.dart';


class ListaNoticias extends StatelessWidget {
  ListaNoticias({Key? key, required this.e}) : super(key: key);
  Article e;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Colors.white, boxShadow: [BoxShadow(offset: Offset(2, 6))]),
        margin: EdgeInsets.all(10),
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(offset: Offset(0, 7), color: Colors.red)
                ]),
                child: Text(
                  e.title.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.redAccent),
                )),
            Center(
                child: Text(
              e.author,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 10,
            ),
            Text(
              e.description,
              style: TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black54),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              e.content,
              style: TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black54),
              textAlign: TextAlign.justify,
            ),
            e.urlToImage.isNotEmpty ? 
            Container(
              width: MediaQuery.of(context).size.width*.5,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5),
                      color: Colors.black54,
                      blurRadius: 7)
                ]),
                child:   Image.network(e.urlToImage) ) : 
                Image.network('https://i.ytimg.com/vi/DC0OL525Y1I/maxresdefault.jpg',width: MediaQuery.of(context).size.width*.4)
          ],
        ));
  }
}
