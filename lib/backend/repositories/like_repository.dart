import 'package:flutter_instagram_app/backend/models/like.dart';

abstract class LikeRepository{

Like add(Like newLike);
Like update(Like likeToUpdate);
bool remove(int liketId);
List<Like> finalAll;
List<Like> findByPostId(int postId);
List<Like> findByUserId(int userId);
List<Like> findByCommentId(int commentId);
}