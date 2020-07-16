import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_app/backend/models/photo.dart';

import 'image_slider.dart';
import 'post_lower_bar.dart';
import 'post_upper_barr.dart';

class PostContainer extends StatefulWidget {
  const PostContainer({
    Key key,
  }) : super(key: key);

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  List<Photo> _photosList = [
    Photo(
        null,
        "https://media.ed.edmunds-media.com/toyota/tacoma/2020/oem/2020_toyota_tacoma_crew-cab-pickup_trd-off-road_fq_oem_4_1600.jpg",
        1600,
        1067),
    Photo(
        null,
        "https://hips.hearstapps.com/hmg-prod/amv-prod-cad-assets/wp-content/uploads/2016/11/2017-Toyota-Tacoma-TRD-Pro-4x4.jpg",
        2250,
        1375),
    Photo(
      null,
      "https://www.pandasecurity.com/mediacenter/src/uploads/2013/11/pandasecurity-facebook-photo-privacy.jpg",
      1280,
      960,
    ),
    Photo(
        null,
        "https://iso.500px.com/wp-content/uploads/2016/02/stock-photo-114337435.jpg",
        1600,
        1066),
  ];

  int _currentPage = 0;

  List<Photo> get _randomList {
    var r = RandomGenerator();
    var size = r.integer(3, min: 1);
    List<int> indexes = r.numbers(5, size);
    List<Photo> temp = [];
    for (int i = 0; i < size; i++) {
      temp.add(_photosList[indexes[i]]);
    }
    return temp;
  }

  void _onPageChanged(int currentPage) {
    setState(() {
      _currentPage = currentPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          PostUpperBar(),
          ImageSlider(
            photosList: _photosList,
            onPageChanged: _onPageChanged,
          ),
          PostLowerBar(
            currentImageIndex: _currentPage,
            numberOfImages: _photosList.length,
          ),
        ],
      ),
    );
  }
}