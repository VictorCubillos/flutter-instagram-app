import 'package:flutter/material.dart';

class Photo {
  int id;
  String url;
  double width;
  double height;

  Photo(this.id, this.url, this.width, this.height);

  Image get data{
    // This will return an image soon!
    return Image.network(url);
  }

  set data(Image image){
    // This will upload the image to the S3 and DB!
  }
}