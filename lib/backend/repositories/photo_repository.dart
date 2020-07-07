import 'package:flutter_instagram_app/backend/models/photo.dart';

abstract class PhotoRepository{

Photo add(Photo newPhoto);
Photo update(Photo photoToUpdate);
bool remove(int photoId);
List<Photo> finalAll;
List<Photo> findByPostId(int postId);

}