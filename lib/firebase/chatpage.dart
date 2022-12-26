import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trabajoapp/homepage.dart';
import 'message.dart';

class PublicarNoticias extends StatefulWidget {
  String email;
  PublicarNoticias({required this.email});
  @override
  _PublicarNoticiasState createState() => _PublicarNoticiasState(email: email);
}

class _PublicarNoticiasState extends State<PublicarNoticias> {
  String email;
  _PublicarNoticiasState({required this.email});

  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(238, 114, 39, 110),
        title:  Text(
              'ABC News Foro' ,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(210, 255, 255, 255)),
            ),
        leading: 
          MaterialButton(
            onPressed: () {
              _auth.signOut().whenComplete(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(email: '',),
                  ),
                );
              });
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)
          ),
      
      ),
      body: SingleChildScrollView(
        child: Container(
          color:Color.fromARGB(237, 201, 165, 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.80,
                child: messages(
                  email: email,
                ),
              ),
              Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: message,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          hintText: 'message',
                          enabled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.purple),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.purple),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {},
                        onSaved: (value) {
                          message.text = value!;
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (message.text.isNotEmpty) {
                          fs.collection('Messages').doc().set({
                            'message': message.text.trim(),
                            'time': DateTime.now(),
                            'email': email,
                          });

                          message.clear();
                        }
                      },
                      icon: Icon(Icons.chat_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}