import 'package:flutter/material.dart';

class Photo {
  int id;
  String url;
  
  Image get data{
    // This will return an image soon!
    return Image.network("https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg");
  }

  set data(Image image){
    // This will upload the image to the S3 and DB!
  }
}