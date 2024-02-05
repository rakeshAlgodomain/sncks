import 'package:flutter/material.dart';
import 'package:sncks/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SignIn'),
        ),
        body: Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    var result = await signInWithGoogle();

                    if (result.user != null) {
                      print("USER DETAILS   >>>> Name, Email : ${result.user!.displayName!}, ${result.user!.email!}");
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => HomePage()));
                    } else {
                      const snackBar = SnackBar(
                          content:
                              Text("Error while doing Sign In with Google"));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text("SignIn With Google")),
              ElevatedButton(
                  onPressed: () {}, child: Text("SignIn With Facebook")),
            ],
          ),
        ));
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  print('MY CREDENTIALS -------> ');
  print(googleUser);
  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
