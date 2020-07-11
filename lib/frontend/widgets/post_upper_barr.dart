import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class PostUpperBar extends StatelessWidget {
  const PostUpperBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var faker = new Faker();

    return Container(
      height: 60,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          // Profile picture
          Container(
            height: double.infinity,
            width: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Material(
                  borderRadius: BorderRadius.circular(50),
                  clipBehavior: Clip.antiAlias,
                  elevation: 3,
                  child: SizedBox(
                    height: 43,
                    width: 43,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Image.network(
                        "https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&h=661&q=70&fm=webp",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      faker.internet.userName(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${faker.address.city()}, ${faker.address.country()}, ${faker.address.zipCode()}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 60,
            child: Center(
              child: IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: (){},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
