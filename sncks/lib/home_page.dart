import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
   const HomePage({super.key});
   

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME APPP"),


      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
          
          const Text(
            "HOME SCREEN "
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () async{
              FirebaseAuth.instance.signOut();  
              Navigator.of(context).pop(
              );

            }, child: Text("LogOut"))
          ],
        ),
      ),
    );
  }
}