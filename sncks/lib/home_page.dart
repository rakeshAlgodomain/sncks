import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


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
        title: const Text("HOME APPP"),


      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
          
          const Text(
            "HOME SCREEN "
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () async{
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut(); 


              Navigator.of(context).pop(
              );
 
            }, child: const Text("LogOut"))
          ],
        ),
      ),
    );
  }
}