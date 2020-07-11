import '../models/like.dart';

abstract class LikeRepository {
  Like add(Like newLike);
  Like update(Like likeToUpdate);
  bool remove(int likeId);
  Like find(int likeId);
  List<Like> findAll();
  List<Like> findByUserId(int userId);
  List<Like> findByPostId(int postId);
  List<Like> findByCommentId(int commentId);
}