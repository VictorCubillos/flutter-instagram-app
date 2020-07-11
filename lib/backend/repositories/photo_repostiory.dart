import '../models/photo.dart';

abstract class PhotoRepository {
  Photo add(Photo newPhoto);
  Photo update(Photo photoToUpdate);
  bool remove(int photoId);
  Photo find(int photoId);
  List<Photo> findAll();
  List<Photo> findByPostId(int postId);  
}