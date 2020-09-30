import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

class UnsplashScreen extends StatefulWidget {
  @override
  _UnsplashScreenState createState() => _UnsplashScreenState();
}

class _UnsplashScreenState extends State<UnsplashScreen> {
   
   List data = [];
   List<String> imgUrl =[];
   List title = [];
    bool showing = false;

   

   getData()async{
     http.Response response = await http.get('https://api.unsplash.com//photos/?client_id=5FYGlHMt6RZgVI55BCDB2v1PLPj7NZfRMcsx-dFSTuQ');
     data = json.decode(response.body);
      // print(imageData);   
     _assign();
      setState(() {
        showing = true;
      });
   }
   _assign (){
     for (var i =0; i < data.length; i++ ){
       imgUrl.add(data.elementAt(i)["urls"]["small"]);
       title.add(data.elementAt(i)["user"]["name"]);
     }
    
   }

   @override
  void initState() {
    
    super.initState(
    );
          getData();

  }
  @override
  Widget build(BuildContext context) {
     
   return GridView.builder(
   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
   itemCount: data.length,
   itemBuilder: (context, int index){
   return Padding(
     padding: EdgeInsets.all(5),
        child: Container(
          
      child:  Column(children: [
         Container(
        child:    Image(image: NetworkImage(imgUrl.elementAt(index)),
        height: 150,),
       
         ),
         Container(
        //  SizedBox(height:2),
      child:  Text(title.elementAt(index)),
         )

        ],
        )
   
      ),
     
   );
    }
    
    
    );


  }
}