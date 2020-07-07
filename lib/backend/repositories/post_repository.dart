import 'package:flutter_instagram_app/backend/models/post.dart';

abstract class PostRepository{

Post add(Post newPost);
Post update(Post postToUpdate);
bool remove(int posttId);
List<Post> finalAll;
List<Post> findByLikeId(int likeId);
List<Post> findByUserId(int userId);
List<Post> findByCommentId(int commentId);
}