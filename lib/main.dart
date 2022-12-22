
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:trabajoapp/homepage.dart';
import 'package:trabajoapp/servicios/noticias.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) {
              return NoticiasApi();
            }),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    ),
    );
  }
}
