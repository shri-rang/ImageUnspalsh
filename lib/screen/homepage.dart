import 'package:flutter/material.dart';  
import './UnsplashScreen.dart';  
import './LocalScreen.dart';  
  

  
class HomePage extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: DefaultTabController(  
        length: 2,  
        child: Scaffold(  
          appBar: AppBar(  
            title: Text('Flutter Tabs Demo'),  
            bottom: TabBar(  
              tabs: [  
                Tab(icon: Icon(Icons.image), text: "API"),  
                Tab(icon: Icon(Icons.camera_alt), text: "Local")  
              ],  
            ),  
          ),  
          body: TabBarView(  
            children: [  
              UnsplashScreen(),  
              LocalScreen(),  
            ],  
          ),  
        ),  
      ),  
    );  
  }  
}  