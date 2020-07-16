import 'package:flutter/material.dart';
import 'package:flutter_instagram_app/backend/models/photo.dart';
import 'package:pinch_zoom_image/pinch_zoom_image.dart';

class ImageSlider extends StatefulWidget {
  final List<Photo> photosList;
  final ValueChanged<int> onPageChanged;

  const ImageSlider({
    Key key,
    this.onPageChanged,
    @required this.photosList,
  }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  /// The initial value of the PageView widget
  int _currentPage = 0;

  /// The calculcated value for the text in the black dot in format <current_page>/<number_of_pages>
  String get textInBlackDot {
    return "${_currentPage + 1}/${widget.photosList.length}";
  }

  /// Called when the vieweing page changes.
  void _onPageChanged(int currentPage) {
    setState(() {
      _currentPage = currentPage;
    });

    if (widget.onPageChanged != null) {
      widget.onPageChanged(currentPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Getting the aspect ratio of every photo
    // Aspect ratio = hight / width
    // hight mayor = numeros más altos
    // width mayor = numeros más bajos
    double aspectRatio = 0;
    for (var photo in widget.photosList) {
      if (photo.height / photo.width > aspectRatio) {
        aspectRatio = photo.height / photo.width;
      }
    }

    // Setting the width of the images...
    var sizedBoxWidth = MediaQuery.of(context).size.width;
    var sizedBoxHeight = sizedBoxWidth * aspectRatio;

    List<Widget> pinchZoomImages = [];
    for (var photo in widget.photosList) {
      pinchZoomImages.add(SizedBox(
        width: sizedBoxWidth,
        child: Center(
          child: PinchZoomImage(
            image: photo.data,
          ),
        ),
      ));
    }

    return Container(
      height: sizedBoxHeight,
      color: Colors.white,
      child: Stack(
        children: [
          PageView(
            physics: BouncingScrollPhysics(),
            children: pinchZoomImages,
            onPageChanged: _onPageChanged,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Visibility(
              visible: widget.photosList.length > 1,
              child: BlackDot(textInBlackDot: textInBlackDot),
            ),
          ),
        ],
      ),
    );
  }
}

class BlackDot extends StatelessWidget {
  const BlackDot({
    Key key,
    @required this.textInBlackDot,
  }) : super(key: key);

  final String textInBlackDot;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: Colors.black.withAlpha(200),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textInBlackDot,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ),
    );
  }
}