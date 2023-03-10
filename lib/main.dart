
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:trabajoapp/homepage.dart';
import 'package:trabajoapp/firebase/login.dart';
import 'package:trabajoapp/servicios/noticias.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
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
      child: MaterialApp(debugShowCheckedModeBanner: false, 
      home: Home()
      ),
    );
  }
}

