import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   String buttonName = "HAPPPPPPPY";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(
          title: const Text('Here we go'),
          backgroundColor: Colors.blue,
        ),
        body: Center(child: ElevatedButton(
          onPressed: (){
            setState(() {
              buttonName = 'DONE';
            });
            
            print('HERE we aee ');

          },
          child: Text(buttonName),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'HOME',
              icon: Icon(Icons.home),
            ),

            BottomNavigationBarItem(
              label: 'SEARCH',
              icon: Icon(Icons.search),
            ),

            
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
           
            
            
          ],
          currentIndex: 2,
        ),
      ),
    );
  }
}