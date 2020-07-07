import 'package:flutter/cupertino.dart';

class Photo{
  int id;
  String url;

  Photo(this.id, this.url);

  Image get data{
    return Image.network("http://smallville.marianobayona.com/goku.jpg");
  }
  set data(Image image){

  }
}