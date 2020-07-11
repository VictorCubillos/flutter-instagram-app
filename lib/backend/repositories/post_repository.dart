import '../models/post.dart';

abstract class PostRepository {
  Post add(Post newPost);
  Post update(Post postToUpdate);
  bool remove(int postId);
  Post find(int postId);
  List<Post> findAll();
  List<Post> findByUserId(int userId);
  List<Post> findByLikeId(int likeId);
  List<Post> findByCommentId(int commentId);
}