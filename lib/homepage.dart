import 'package:flutter/material.dart';
import 'package:noticas_abc/colombia.dart';
import 'package:noticas_abc/cuba.dart';
import 'package:noticas_abc/mexico.dart';
import 'package:noticas_abc/portugal.dart';
import 'package:noticas_abc/argentina.dart';
import 'package:noticas_abc/eeuu.dart';
import 'package:noticas_abc/servicios/classnoticias.dart';
import 'package:noticas_abc/servicios/classtitulares.dart';
import 'package:noticas_abc/servicios/noticias.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final titularesHoy = Provider.of<NoticiasApi>(context, listen: true);
    final List<Article> titulares = titularesHoy.titularesHoy;
    final List<Articles> titularesAR = titularesHoy.titularesAr;
    final List<Articles> titularesAE = titularesHoy.titularesPortugal;
    final List<Articles> titularesCO = titularesHoy.titularesCO;
    final List<Articles> titularesCU = titularesHoy.titularesCuba;
    final List<Articles> titularesMX = titularesHoy.titularesMexico;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(238, 114, 39, 110),
        elevation: 0,
        title: Column(
          children: [
            Text(
              'ABC News',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(210, 255, 255, 255)),
            ),
            Text(
              '${DateTime.now().day} - ${DateTime.now().month}-  ${DateTime.now().year}'
                  .toUpperCase(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(210, 242, 237, 237)),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://i.pinimg.com/474x/88/03/a5/8803a5b9b3557af335dd1b53a0f285b3.jpg'))),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: _decoration(),
                          child: Column(
                            children: [
                              Container(
                                decoration: _decoration(),
                                child: Column(
                                  children: [
                                    Title(text: 'Noticias Arentina'),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            ...titularesAR.map(
                                              (e) => Argentina(
                                                e: e,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Title(
                                      text: 'Noticias EEUU',
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          ...titulares.map(
                                            (e) => ListaNoticias(
                                              e: e,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    Title(
                                      text: 'Noticias Brasil',
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          ...titularesAE.map(
                                            (e) => Portugal(
                                              e: e,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                     Title(
                                      text: 'Noticias Colombia',
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          ...titularesCO.map(
                                            (e) => Colombia(
                                              e: e,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                     Title(
                                      text: 'Noticias Cuba',
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          ...titularesCU.map(
                                            (e) => Cuba(
                                              e: e,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                     Title(
                                      text: 'Noticias Mexico',
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          ...titularesMX.map(
                                            (e) => Mexico(
                                              e: e,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
        // color: Color.fromARGB(255, 190, 169, 180),

        boxShadow: [
          BoxShadow(offset: Offset(5, 5), blurRadius: 20, color: Colors.black12)
        ]);
  }
}

class Title extends StatelessWidget {
  Title({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 0),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: Color.fromARGB(255, 149, 118, 3)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }
}
