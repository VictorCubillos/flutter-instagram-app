import 'package:flutter/material.dart';

class PostLowerBar extends StatelessWidget {
  final int numberOfImages;
  final int currentImageIndex;

  const PostLowerBar({
    Key key,
    @required this.numberOfImages,
    @required this.currentImageIndex,
  }) : super(key: key);

  /// The middle dots that will be shown in this bar, number of dots corresponds to numberOfImages
  /// and the blue dot will correspond to the current image index.
  Widget get _middleDots {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfImages; i++) {
      dots.add(Row(
        children: <Widget>[
          SizedBox(width: 2),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 5,
              height: 5,
              color: i == currentImageIndex ? Colors.blue : Colors.grey,
            ),
          ),
          SizedBox(width: 2),
        ],
      ));
    }

    return Container(
      width: 60,
      height: 10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: dots,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          // Row que separa a los icons izquierda - derecha
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.chat_bubble_outline),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.bookmark_border),
              ),
            ],
          ),
          // Middle dots
          Visibility(
            visible: numberOfImages > 1,
            child: Center(child: _middleDots),
          ),
        ],
      ),
    );
  }
}