import 'package:flutter_instagram_app/backend/models/comment.dart';

abstract class CommentRepository{

Comment add(Comment newComment);
Comment update(Comment commentToUpdate);
bool remove(int commentId);
List<Comment> finalAll;
List<Comment> findByPostId(int postId);
}