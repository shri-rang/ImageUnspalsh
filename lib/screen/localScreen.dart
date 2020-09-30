import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';




class LocalScreen extends StatefulWidget {
  @override
  _LocalScreenState createState() => _LocalScreenState();
}

class _LocalScreenState extends State<LocalScreen> {

    File _image;
    File storeimage;
    String save = 'saved';

    Future<void> _getImage()async{
          //  final   pickImage  =   ImagePicker();
          // final imageFile = await pickImage.getImage(source: ImageSource.camera, maxWidth: 600);
           ImagePicker().getImage(source: ImageSource.camera).then((dynamic recordedImage){
             if (recordedImage != null && recordedImage.path != null){
                // setState(() {
                  
                // });
                GallerySaver.saveImage(recordedImage.path).then(
                  (dynamic path){
                     
                    
                  }
                );
             }
           });
                
         
      
     } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: _getImage
        
        ),
      body: Padding(
        padding: EdgeInsets.all(10),
              child: Container(
                height: 500,
                
            child:     Center(
            child: _image == null ? Text('image is not loaded') : Image.file(_image
            
            )
          ),         
        ),
      ),
    );

  }
}